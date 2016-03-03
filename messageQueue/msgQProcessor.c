#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include "myMsgBuf.h"


void processMSGQ(void) {
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

	for(;;) { /* Spock never quits! */
		if (msgrcv(msqid, &buf, sizeof buf.event , 0, 0) == -1) {
			perror("msgrcv");
			exit(1);
		}
		printf("AL: %u :%s,%s:\n", buf.event.action, buf.event.aNumber, buf.event.bNumber);
	}
}
