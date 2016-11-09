typedef struct _CAM_HANDLER* CAM_HANDLER;

void cam_init(CAM_HANDLER* hdl);
int  cam_print(CAM_HANDLER hdl);
void cam_close(CAM_HANDLER hdl);
