function [x,y,z,c] = Flatten(x,y,z,xi,yi,zi,resolution, flatten_height)
    %% This function sets any vertice that is below the set "flatten_height" value from origin to the "flatten_height" value.
    global generate;
    generate.Text = "Flattening...";
    
    for i = 1:(resolution+1)^2*6
        if ( sqrt(x(i)^2 + y(i)^2 + z(i)^2) < sqrt(xi(i)^2 + yi(i)^2 + zi(i)^2)*flatten_height)
            x(i) = xi(i)*flatten_height;
            y(i) = yi(i)*flatten_height;
            z(i) = zi(i)*flatten_height;
        end
    end
    c = sqrt(x.^2 + y.^2 + z.^2);
end