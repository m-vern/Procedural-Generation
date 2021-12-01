function [x,y,z,c] = Cube_Sphere(r,s,g)
    %% Inputs resolution and side-size and outputs cube-sphere vertices
    % Get (x, y, z) coordinates of a cube
    [xC,yC,zC] = Cube(r,1,g);
    
    % Force cube coordinates into a sphere
    x = xC.*sqrt(1 - yC.^2/2 - zC.^2/2 + (yC.^2.*zC.^2)/3); x = x.*s/2;
    y = yC.*sqrt(1 - zC.^2/2 - xC.^2/2 + (zC.^2.*xC.^2)/3); y = y.*s/2;
    z = zC.*sqrt(1 - xC.^2/2 - yC.^2/2 + (xC.^2.*yC.^2)/3); z = z.*s/2;
    
    % Calculate height of vertices
    c = sqrt(x.^2 + y.^2 + z.^2);
end