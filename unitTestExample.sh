rm -rf unitTestExample
mkdir unitTestExample
cd unitTestExample/

######################################################################################################################
# Create rating 'engine...'

read -r -d '' simpleraterc <<'EOF'
#include <stdio.h>
#include <time.h>

int rater (int event) {
	time_t now;
    struct tm *lcltime;

    now = time ( NULL );
    lcltime = localtime ( &now );

    switch(event) {
    	case 0 : // voice
    		if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
    			return 60;
    		else 
    			return 20;
    		break;
    	case 1 : // sms
    		if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
    			return 40;
    		else 
    			return 10;
    	default : // unknown
    		return -1;
    }	
}
EOF
echo "$simpleraterc" > simpleRater.c

read -r -d '' simpleraterh <<'EOF'
int rater (int event);
EOF
echo "$simpleraterh" > simpleRater.h


##########################################################################################################################
# Creating the main process that query current SMS price

read -r -d '' getcSMSPricec <<'EOF'
#include <stdio.h>
#include "simpleRater.h"

int main() {
	printf("Current SMS price is : %u\n", rater(1));	
	return (0);
}
EOF
echo "$getcSMSPricec" > getCurrentSMSPrice.c


#########################################################################################################################
# Testing the main process

read -r -d '' makefile1 <<'EOF'
CC=gcc
CFLAGS=-I.

getCurrentSMSPrice: getCurrentSMSPrice.o simpleRater.o
	$(CC) -o smsPrice getCurrentSMSPrice.o simpleRater.o $(CFLAGS)

EOF
echo "$makefile1" > Makefile

make

./smsPrice



############################################################################################################################
# Create unit tester program


read -r -d '' raterTesterc <<'EOF'
#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <stdio.h>
#include "simpleRater.h"

time_t faketime = 1456261125;

time_t __wrap_time(time_t *tloc) {
    //printf("Time is wrapped...");
    return faketime;
}

int set_nightTime(void **state) {
    faketime = 820537871;
    return 0;
}         

int set_dayTime(void **state) {
    faketime = 820491071;
    return 0;
}         


static void test_unknown_eventType(void **state) {
     assert_int_equal(rater(2),-1);
}

static void test_smsRating_daytime(void **state) {
     assert_int_equal(rater(1),40);
}

static void test_smsRating_nighttime(void **state) {
     assert_int_equal(rater(1),10);
}

static void test_voiceRating_daytime(void **state) {
     assert_int_equal(rater(0),60);
}

static void test_voiceRating_nighttime(void **state) {
     assert_int_equal(rater(0),20);
}


int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_unknown_eventType),
        cmocka_unit_test_setup(test_smsRating_daytime, set_dayTime ),
        cmocka_unit_test_setup(test_smsRating_nighttime, set_nightTime ),
        cmocka_unit_test_setup(test_voiceRating_daytime, set_dayTime),
        cmocka_unit_test_setup(test_voiceRating_nighttime, set_nightTime),
    };

    return cmocka_run_group_tests_name("Rating test", tests, NULL, NULL);
}

EOF
echo "$raterTesterc" > raterTester.c

############################################################################################################################
# Create make target for testing

read -r -d '' makefile2 <<'EOF'


test: raterTester.o simpleRater.o
	$(CC) -o tester -Wl,--wrap=time raterTester.o simpleRater.o $(CFLAGS) $(LIBS) -lcmocka
	./tester
EOF
echo "$makefile2" >> Makefile

make test

############################################################################################################################
# Create unit testing program with cmocka assisted functions

read -r -d '' raterTester2c <<'EOF'
#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <stdio.h>
#include "simpleRater.h"

time_t faketime = 1456261125;

time_t __wrap_time(time_t *tloc) {
    return (time_t)mock();;
}

static void test_smsRating_daytime(void **state) {
    will_return(__wrap_time, (time_t)820491071);
    assert_int_equal(rater(1),40);
}

static void test_smsRating_nighttime(void **state) {
    will_return(__wrap_time, (time_t)820537871);
    assert_int_equal(rater(1),10);
}

static void test_voiceRating_daytime(void **state) {
    will_return(__wrap_time, (time_t)820491071);
    assert_int_equal(rater(0),60);
}

static void test_voiceRating_nighttime(void **state) {
    will_return(__wrap_time, (time_t)820537871);
    assert_int_equal(rater(0),20);
}


int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_smsRating_daytime),
        cmocka_unit_test(test_smsRating_nighttime),
        cmocka_unit_test(test_voiceRating_daytime),
        cmocka_unit_test(test_voiceRating_nighttime),
    };

    return cmocka_run_group_tests_name("Rating test", tests, NULL, NULL);
}
EOF
echo "$raterTester2c" >> raterTester2.c


############################################################################################################################
# Create make target for testing this new approach

read -r -d '' makefile3 <<'EOF'


test2: raterTester2.o simpleRater.o
	$(CC) -o tester2 -Wl,--wrap=time raterTester.o simpleRater.o $(CFLAGS) $(LIBS) -lcmocka
	./tester2
EOF
echo "$makefile3" >> Makefile

make test2

############################################################################################################################
# Generate code coverage output in HTML format for unit tests


read -r -d '' makefile4 <<'EOF'


ntest: clean testcompile

testcompile: CFLAGS += -fprofile-arcs  -ftest-coverage
testcompile: raterTester.o simpleRater.o
	$(CC) -o tester -Wl,--wrap=time raterTester.o simpleRater.o $(CFLAGS) $(LIBS) -lcmocka
	./tester
	lcov --capture --directory . --output-file coverage.info 
	genhtml coverage.info --output-directory out

clean: 
	rm -f *.o smsPrice voicePrice tester tester2 *.gcda *.gcno
	rm -rf out

EOF

echo "$makefile4" >> Makefile

make ntest