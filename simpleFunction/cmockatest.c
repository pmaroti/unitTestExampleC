#include <stdlib.h>
#include <stdarg.h>
#include <stddef.h>
#include <setjmp.h>
#include <cmocka.h>

int setup(void **state) {
          int *answer = malloc(sizeof(int));
          if (answer == NULL) {           
              return -1;
          }
          *answer = 42;
     
          *state = answer;
     
         return 0;
    }
    
    static int teardown(void **state) {
         free(*state);
    
         return 0;
    }
    
    static void null_test_success(void **state) {
        (void) state;
    }
    
    static void int_test_success(void **state) {
         int *answer = *state;
         assert_int_equal(*answer, 42);
    }

    static void int_test_fail(void **state) {
         int *answer = *state;
         assert_int_equal(*answer, -1);
    }
        
    
    int main(void) {
        const struct CMUnitTest tests[] = {
            cmocka_unit_test(null_test_success),
            cmocka_unit_test_setup_teardown(int_test_success, setup, teardown),
            cmocka_unit_test_setup_teardown(int_test_fail, setup, teardown),
        };
    
        return cmocka_run_group_tests_name("success_test", tests, NULL, NULL);
    }
