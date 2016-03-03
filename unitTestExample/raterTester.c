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
        //cmocka_unit_test_setup(test_voiceRating_nighttime, set_nightTime),
    };

    return cmocka_run_group_tests_name("Rating test", tests, NULL, NULL);
}
