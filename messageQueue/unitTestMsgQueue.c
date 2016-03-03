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

#include "msgQProcessor.h"
#include "myMsgBuf.h"


int main(void)
{
    pid_t childPID;

    childPID = fork();

    if(childPID >= 0) { // fork was successful
        if(childPID == 0) { // child process
            processMSGQ();
        }
        else {//Parent process
            struct my_msgbuf buf;
            int msqid;
            key_t key;

            if ((key = ftok("kirk.c", 'B')) == -1) {
                perror("ftok");
                exit(1);
            }

            if ((msqid = msgget(key, 0644 | IPC_CREAT)) == -1) {
                perror("msgget");
                exit(1);
            }

            buf.mtype = 1; /* we don't really care in this case */
            strcpy(buf.event.aNumber,"+36209302417");
            strcpy(buf.event.bNumber,"+36209303398");
            buf.event.action = ACTION_VOICE;

            if (msgsnd(msqid, &buf, sizeof buf.event , 0) == -1) /* +1 for '\0' */
                    perror("msgsnd");
        }
    }
    else { // fork failed
        printf("\n Fork failed, quitting!!!!!!\n");
        return 1;
    }

    return 0;
}
