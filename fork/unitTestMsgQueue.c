#include <unistd.h>
#include <sys/types.h>
#include <errno.h>
#include <stdio.h>
#include <sys/wait.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/ipc.h>
#include <sys/msg.h>


struct my_msgbuf {
    long mtype;
    char mtext[200];
};


int main(void)
{
    pid_t childPID;

    childPID = fork();

    if(childPID >= 0) // fork was successful
    {
        if(childPID == 0) // child process
        {
            struct my_msgbuf buf;
            int msqid;
            key_t key;

            if ((key = ftok("kirk.c", 'B')) == -1) {  /* same key as kirk.c */
                perror("ftok");
                exit(1);
            }

            if ((msqid = msgget(key, 0644)) == -1) { /* connect to the queue */
                perror("msgget");
                exit(1);
            }
            
            printf("spock: ready to receive messages, captain.\n");

            for(;;) { /* Spock never quits! */
                if (msgrcv(msqid, &buf, sizeof buf.mtext, 0, 0) == -1) {
                    perror("msgrcv");
                    exit(1);
                }
                printf("spock: \"%s\"\n", buf.mtext);
            }

        }
        else //Parent process
        {
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
            
            printf("Enter lines of text, ^D to quit:\n");

            buf.mtype = 1; /* we don't really care in this case */

            while(fgets(buf.mtext, sizeof buf.mtext, stdin) != NULL) {
                int len = strlen(buf.mtext);

                /* ditch newline at end, if it exists */
                if (buf.mtext[len-1] == '\n') buf.mtext[len-1] = '\0';

                if (msgsnd(msqid, &buf, len+1, 0) == -1) /* +1 for '\0' */
                    perror("msgsnd");
            }

            if (msgctl(msqid, IPC_RMID, NULL) == -1) {
                perror("msgctl");
                exit(1);
            }

        }
    }
    else // fork failed
    {
        printf("\n Fork failed, quitting!!!!!!\n");
        return 1;
    }

    return 0;
}