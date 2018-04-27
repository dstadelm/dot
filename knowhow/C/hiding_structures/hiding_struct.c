#include <stdio.h>
#include <stdlib.h>
#include "hiding_struct.h"
typedef struct _CAM_HANDLER {
  int x;
  int y;
}_CAM_HDL;


void cam_init(CAM_HANDLER* hdl){
  *hdl = (CAM_HANDLER)malloc(sizeof(_CAM_HDL));
  (*hdl)->x = 3;
  (*hdl)->y = 5;
}

int cam_print(CAM_HANDLER hdl){
  static int i = 0;
  printf("X = %d\n",hdl->x);
  return i++;
}

void cam_close(CAM_HANDLER hdl){
  free(hdl);
}
