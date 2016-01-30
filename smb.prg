program smb;

begin
set_mode(320240);
set_fps(60,2);

load_fpg("smb/smb.FPG");

define_region(1,0,8,320,224);

start_scroll(1,file,0,101,1,0);

loop

scroll[1].x0++;
//scroll[1].x1+=4;

frame;

end

end