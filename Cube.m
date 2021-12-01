function [x,y,z,c] = Cube(r,s)
    %% This function generates an (r by r by 6) matrix, or 6 square face grids, of vertices resembling a cube.
    % Where r = resolution and s = length, width, and height of cube
    
    % Create a square grid in 3D-space for given r value 
    % Where x,y,z are coordinates representing vertices on a square grid
    x = gpuArray(linspace(-r,r,r+1)); x = repmat(x,r+1,1); x = (x/r)*s;
    y = gpuArray(rot90(linspace(-r,r,r+1))); y = repmat(y,1,r+1); y = (y/r)*s;
    z = gpuArray(-ones(r+1)*r); z = (z/r)*s;
    
    % Repeat and offset the square grid to create the six sides of the cube
    x(:,:,2) = x(:,:,1); x(:,:,3) = z(:,:,1); x(:,:,4:6) = -x(:,:,1:3);
    y(:,:,2) = z(:,:,1); y(:,:,3) = x(:,:,1); y(:,:,4:6) = -y(:,:,1:3);
    z(:,:,2) = y(:,:,1); z(:,:,3) = y(:,:,1); z(:,:,4:6) = -z(:,:,1:3);
    
    % Where c is the distance the vertice is from the origin (0,0,0)
    c = sqrt(x.^2 + y.^2 + z.^2);
end