clc;clear;clear global;

%% Declare global variables for Callback
global res;
global size;
global amp_1;
global amp_2;
global flatten;
global generated; generated = false;
global GUI;
global use_GPU;

%% On-Load
try
    Get_GUI();
    running = true;
catch
   error("Error: Could not load GUI. Exiting");
end

%% Update
while running
    if (~ishandle(GUI))
         running = false;
         break;
    end
    
    if generated
        [x,y,z] = Cube_Sphere(res,size,use_GPU);
        xi = x; yi = y; zi = z;
        [x,y,z] = Procedural_Noise(x,y,z,res,amp_1,amp_2,flatten,use_GPU);
        [x,y,z] = Seams(x,y,z,xi,yi,zi,res);
        [x,y,z,c] = Flatten(x,y,z,xi,yi,zi,res,flatten);
        
        Render(x,y,z,c);       
        
        generated = false;
    end
    pause(1)
end