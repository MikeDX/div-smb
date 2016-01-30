program smb;

begin
set_mode(320240);
set_fps(30,2);

load_fpg("smb/smb.FPG");

define_region(1,0,8,320,224);

start_scroll(1,file,0,101,1,0);

mario();
loop

//scroll[1].x0++;
//scroll[1].x1+=4;

frame;

end

end


process mario()

private
walking=0;
anim=0;
jump=10;
dir=0;

begin

x=88;//200;//224-32+8;
y=192;
ctype=c_scroll;
region=1;
//cnumber=1;


graph=1;

loop

    if(key(_right))
        if(walking<3)
            walking++;
            dir=1;
            flags=0;
        end
    end

    if(key(_left))
        if(walking<3)
            walking++;
            dir=-1;
            flags=1;
        end

    end

    if(key(_space) && y==192)
        jump=-8;
    end


    if(jump<9)
        graph=2;
        y+=jump;
        jump++;
    end



    if(walking==0 && jump>=8)
        graph=1;
    end




    if(walking>0)

        x+=dir*2;

        if(jump>=8)
            walking--;

            if(graph<4 || graph>5)
                graph=4;
            end

            if(anim++%2==1);
                graph++;
            end
        end

        if(scroll[1].x0<x-128)
            scroll[1].x0+=2;
        end

    end

    frame;

end

end

