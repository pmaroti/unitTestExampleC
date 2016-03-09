CC=gcc
CFLAGS=-I.

msgQSender: msgQSender.o
	$(CC) -o msgQSender msgQSender.o $(CFLAGS)

msgQReceiver: msgQReceiver.o msgQProcessor.o
	$(CC) -o msgQReceiver msgQReceiver.o msgQProcessor.o $(CFLAGS)

unitTester: clean testcompile

testcompile: CFLAGS += -fprofile-arcs  -ftest-coverage
testcompile: unitTestMsgQueue.o msgQProcessor.o
	$(CC) -o unitTester -Wl,--wrap=msgsnd unitTestMsgQueue.o msgQProcessor.o $(CFLAGS) $(LIBS) -lcmocka -lpthread
	./unitTester
	lcov --capture --directory . --output-file coverage.info
	genhtml coverage.info --output-directory out

clean:
	rm -f *.o msgQSender msgQReceiver unitTester *.gcda *.gcno
	rm -rf out
