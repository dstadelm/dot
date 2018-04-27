// The principal idea of this file is to show how the content of the 
// CAM_HANDLER struct can be hidden from the user. This is usefull, if you
// are implementing a library. This gives object oriented flavour to the 
// procedural language C


#include "hiding_struct.h"
#include <stdio.h>

// a very stupid idea of how to wight a loop :-)
//
#define CHECK_ERROR(err) if(err < 5) goto ERROR

int main(){
  CAM_HANDLER hdl;
  int i = 0;
  cam_init(&hdl);

ERROR:
  printf("i = %d\n ",i);
  CHECK_ERROR((i = cam_print(hdl)));
  cam_close(hdl);
}

