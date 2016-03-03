CC=gcc
CFLAGS=-I. 
LIBS=-lcmocka

getCurrentSMSPrice: getCurrentSMSPrice.o simpleRater.o
	$(CC) -o smsPrice getCurrentSMSPrice.o simpleRater.o $(CFLAGS)

getCurrentVoicePrice: getCurrentVoicePrice.o simpleRater.o
	$(CC) -o voicePrice getCurrentVoicePrice.o simpleRater.o $(CFLAGS)	

test: raterTester.o simpleRater.o
	$(CC) -o tester -Wl,--wrap=time raterTester.o simpleRater.o $(CFLAGS) $(LIBS) -lgcov
	./tester

test2: raterTester2.o simpleRater.o
	$(CC) -o tester2 -Wl,--wrap=time raterTester2.o simpleRater.o $(CFLAGS) $(LIBS)
	./tester2	

ntest: clean testcompile

testcompile: CFLAGS += -fprofile-arcs  -ftest-coverage
testcompile: raterTester.o simpleRater.o
	$(CC) -o tester -Wl,--wrap=time raterTester.o simpleRater.o $(CFLAGS) $(LIBS) -lgcov
	./tester
	lcov --capture --directory . --output-file coverage.info 
	genhtml coverage.info --output-directory out

clean: 
	rm -f *.o smsPrice voicePrice tester tester2 *.gcda *.gcno
	rm -rf out
