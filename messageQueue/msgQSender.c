/*
*/

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <unistd.h>
#include "myMsgBuf.h"

int main(void)
{
	struct rating_request request;
	int msqid;
	key_t key;

	if ((key = ftok("msgQProcessor.c", 'B')) == -1) {
		perror("ftok");
		exit(1);
	}

	if ((msqid = msgget(key, 0644)) == -1) {
		perror("msgget");
		exit(1);
	}

	request.mtype = MSG_TYPE_RATINGREQ;
	request.event.action = ACTION_SMS;
	strcpy(request.event.aNumber,"209302417");
	strcpy(request.event.bNumber,"209303398");

	if (msgsnd(msqid, &request, sizeof request.event, 0) == -1)
		perror("msgsnd");

	sleep(5);

	if (msgctl(msqid, IPC_RMID, NULL) == -1) {
		perror("msgctl");
		exit(1);
	}

	return 0;
}
