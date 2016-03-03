#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>
#include <stdio.h>
#include "simpleRater.h"

time_t faketime = 1456261125;

time_t __wrap_time(time_t *tloc) {
    return (time_t)mock();;
}

static void test_smsRating_daytime(void **state) {
    will_return(__wrap_time, (time_t)820491071);
    assert_int_equal(rater(1),40);
}

static void test_smsRating_nighttime(void **state) {
    will_return(__wrap_time, (time_t)820537871);
    assert_int_equal(rater(1),10);
}

static void test_voiceRating_daytime(void **state) {
    will_return(__wrap_time, (time_t)820491071);
    assert_int_equal(rater(0),60);
}

static void test_voiceRating_nighttime(void **state) {
    will_return(__wrap_time, (time_t)820537871);
    assert_int_equal(rater(0),20);
}


int main(void) {
    const struct CMUnitTest tests[] = {
        cmocka_unit_test(test_smsRating_daytime),
        cmocka_unit_test(test_smsRating_nighttime),
        cmocka_unit_test(test_voiceRating_daytime),
        cmocka_unit_test(test_voiceRating_nighttime),
    };

    return cmocka_run_group_tests_name("Rating test", tests, NULL, NULL);
}
