function [x,y,z,c] = Seams(x,y,z,xi,yi,zi, resolution)
    %% "stitches" seams  that were seperated when noise was added to the shape
    % This function needs simplified, although it runs quickly on the
    % gpu
    global generate
    generate.Text = "Stitching Seams...";
    for ii = 1:6
        for i = 1:resolution+1
            k=find(xi==xi(i,1,ii));
            k=[k; find(yi==yi(i,1,ii))];
            k=[k; find(zi==zi(i,1,ii))];
            k = k(2:end);
            k = mode(k,'all');
            x(i,1,ii) = (x(k) + x(i,1,ii))/2; x(k) = x(i,1,ii);
            y(i,1,ii) = (y(k) + y(i,1,ii))/2; y(k) = y(i,1,ii);
            z(i,1,ii) = (z(k) + z(i,1,ii))/2; z(k) = z(i,1,ii);
            
            k=find(xi==xi(i,end,ii));
            k=[k; find(yi==yi(i,end,ii))];
            k=[k; find(zi==zi(i,end,ii))];
            k = k(2:end);
            k = mode(k,'all');
            x(i,end,ii) = (x(k) + x(i,end,ii))/2; x(k) = x(i,end,ii);
            y(i,end,ii) = (y(k) + y(i,end,ii))/2; y(k) = y(i,end,ii);
            z(i,end,ii) = (z(k) + z(i,end,ii))/2; z(k) = z(i,end,ii);
            
            k=find(xi==xi(end,i,ii));
            k=[k; find(yi==yi(end,i,ii))];
            k=[k; find(zi==zi(end,i,ii))];
            k = k(2:end);
            k = mode(k,'all');
            x(end,i,ii) = (x(k) + x(end,i,ii))/2; x(k) = x(end,i,ii);
            y(end,i,ii) = (y(k) + y(end,i,ii))/2; y(k) = y(end,i,ii);
            z(end,i,ii) = (z(k) + z(end,i,ii))/2; z(k) = z(end,i,ii);
            
            k=find(xi==xi(1,i,ii));
            k=[k; find(yi==yi(1,i,ii))];
            k=[k; find(zi==zi(1,i,ii))];
            k = k(2:end);
            k = mode(k,'all');
            x(1,i,ii) = (x(k) + x(1,i,ii))/2; x(k) = x(1,i,ii);
            y(1,i,ii) = (y(k) + y(1,i,ii))/2; y(k) = y(1,i,ii);
            z(1,i,ii) = (z(k) + z(1,i,ii))/2; z(k) = z(1,i,ii);
        end
    end
    
    c = sqrt(x.^2 + y.^2 + z.^2);
end