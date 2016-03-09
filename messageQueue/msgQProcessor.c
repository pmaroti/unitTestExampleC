#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include "myMsgBuf.h"
#include <time.h>


void processMSGQ(void) {
	struct rating_request req;
	struct rating_answer ans;
	int msqid;
	key_t key;

	printf("DEBUG: message processor started.");

	if ((key = ftok("msgQProcessor.c", 'B')) == -1) {
		perror("ftok");
		exit(1);
	}

	if ((msqid = msgget(key, 0644 | IPC_CREAT)) == -1) { /* connect to the queue */
		perror("msgget");
		exit(1);
	}

	printf("DEBUG: message processor started2.");

	for(;;) {
		time_t now;
	  struct tm *lcltime;

	  now = time ( NULL );
	  lcltime = localtime ( &now );

		if (msgrcv(msqid, &req, sizeof req.event , MSG_TYPE_RATINGREQ, 0) == -1) {
			perror("msgrcv");
			exit(1);
		}

		printf("DEBUG: message received, details: %u |%s,%s|\n", req.event.action, req.event.aNumber, req.event.bNumber);

		switch(req.event.action) {
			case ACTION_VOICE:
				ans.mtype = MSG_TYPE_RATINGANS;
				if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
					ans.rating.price = 60;
				else
					ans.rating.price = 20;
				break;

			case ACTION_SMS:
				ans.mtype = MSG_TYPE_RATINGANS;

				if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
    			ans.rating.price = 40;
    		else
    			ans.rating.price = 10;
				break;
		}

		if (msgsnd(msqid, &ans, sizeof ans.rating, 0) == -1) /* +1 for '\0' */
			perror("msgsnd");
	}
}
