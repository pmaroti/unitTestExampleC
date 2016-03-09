#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <errno.h>
#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <unistd.h>

#include "msgQProcessor.h"
#include "myMsgBuf.h"

#include <pthread.h>

int msqid;

int __wrap_msgsnd(int msqid, const void *msgp, size_t msgsz, int msgflg) {
  printf("AAAA");
}


void test_SMS(void **state) {
  struct rating_request request;

  request.mtype = MSG_TYPE_RATINGREQ;
  request.event.action = ACTION_SMS;
  strcpy(request.event.aNumber,"209302417");
  strcpy(request.event.bNumber,"209303398");

  struct rating_answer ans;
  ans.mtype = MSG_TYPE_RATINGANS;
  ans.rating.price = 11;



  if (__real_msgsnd(msqid, &request, sizeof request.event, 0) == -1)
    perror("msgsnd");
}

void *THREAD(void *x_void_ptr) {
  processMSGQ();
  return NULL;
}

int main(void) {
  int retVal=-5;
  pid_t childPID;

  pthread_t msg_proc_thread;

  if(pthread_create(&msg_proc_thread, NULL, THREAD , &retVal)) {
    printf("Error creating thread\n");
    return 1;
  }

  /*childPID = fork();
  printf("aaaa");
  */

  /*
  if(childPID >= 0) { // fork was successful
      if(childPID == 0) { // child process
          processMSGQ();
      }
      else {//Parent process
      */
        int msqid;
        key_t key;

        if ((key = ftok("msgQProcessor.c", 'B')) == -1) {
          perror("ftok");
          exit(1);
        }

        if ((msqid = msgget(key, 0644 | IPC_CREAT)) == -1) {
          perror("msgget");
          exit(1);
        }

        const struct CMUnitTest tests[] = {
          cmocka_unit_test(test_SMS)
        };

        retVal = cmocka_run_group_tests(tests, NULL, NULL);

        /*
      }
  }
  else { // fork failed
      printf("\n Fork failed, quitting!!!!!!\n");
      return 1;
  }
  */
  return retVal;
}
