#define ACTION_VOICE 0
#define ACTION_SMS 1


struct my_msgbuf {
	long mtype;
	struct event_info {
		char aNumber[20];
		char bNumber[20];
		int action;
	} event;
};
