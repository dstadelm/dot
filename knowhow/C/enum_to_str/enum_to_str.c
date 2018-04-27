/*
 * ============================================================================
 *
 *    Description:  Example to show how enumerations can be created which can
 *    automatically be converted to a character array. This is especially 
 *    usefull for error handling in plain c
 *
 * ============================================================================
 */
#include <stdio.h>

#define FOREACH_ERROR(ERROR) \
        ERROR(MY_FIRST_ERROR)   \
        ERROR(MY_SECOND_ERROR)  \
        ERROR(MY_THIRD_ERROR)   \
        ERROR(MY_FOURTH_ERROR)  \

#define GENERATE_ENUM(ENUM) ENUM,
#define GENERATE_STRING(STRING) #STRING,

enum ERROR_ENUM {
    FOREACH_ERROR(GENERATE_ENUM)
};

static const char *ERROR_STRING[] = {
    FOREACH_ERROR(GENERATE_STRING)
};

const char * toString(enum ERROR_ENUM fruit){
  return ERROR_STRING[fruit];
}

int main(){
  enum ERROR_ENUM err = MY_FIRST_ERROR;
  printf("enum err as string: %s\n", toString(err));
  return 0;
}
