#define ACTION_VOICE 0
#define ACTION_SMS 1
#define ACTION_STOP -1

#define MSG_TYPE_RATINGREQ 1
#define MSG_TYPE_RATINGANS 2

struct rating_request {
	long mtype;
	struct event_info {
		char aNumber[20];
		char bNumber[20];
		int action;
	} event;
};

struct rating_answer {
	long mtype;
	struct rating_info {
		int price;
	} rating;
};
