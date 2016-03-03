#include <stdio.h>
#include <time.h>

int rater (int event) {
	time_t now;
    struct tm *lcltime;

    now = time ( NULL );
    lcltime = localtime ( &now );

    switch(event) {
    	case 0 : // voice
    		if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
    			return 60;
    		else 
    			return 20;
    		break;
    	case 1 : // sms
    		if( (lcltime->tm_hour > 6) && (lcltime->tm_hour < 18) )
    			return 40;
    		else 
    			return 10;
    	default : // unknown
    		return -1;
    }	
}
