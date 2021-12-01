function Render(x,y,z,c)
    %% Renders the generated shape to the GUI screen
    %Update Load Status/Color
    global generate
    generate.Text = "Rendering...";
    load_r = 1; %load bar red color
    generate.BackgroundColor = [load_r 1 0]; drawnow
        
    %Manage axes and camera projection
    global ax;
    cla(ax);
    
    hold(ax, 'on')
    axis(ax, 'vis3d' )  
    rotate3d(ax, 'on')
    
    % Read surface texture
    global texture_dropdown
    tex = texture_dropdown.Value;
    surfs = [0 0 0 0 0 0];
    if (tex == "Height Map")
        fc = 'interp';
        ec = 'black';
        for i = 1:6
            surfs(i) = surf(ax, x(:,:,i), y(:,:,i), z(:,:,i), c(:,:,i), "FaceColor", fc, "FaceAlpha", 1, 'EdgeColor', ec);
            load_r = load_r-(1/7);
            generate.BackgroundColor = [load_r 1 0]; drawnow %Updates load bar color
        end
    else
        I = imread("Textures/" + tex + ".jpg");
        fc = 'texturemap';
        ec = 'none';
        for i = 1:3
            surfs(i) = surf(ax, x(:,:,i), y(:,:,i), z(:,:,i), "FaceColor", fc, 'CData',flip(I(1:height(I)/2, 1+round((i-1)*width(I)/3):round(i*width(I)/3), 1:3)), "FaceAlpha", 1, 'EdgeColor', ec);
            load_r = load_r-(1/7);
            generate.BackgroundColor = [load_r 1 0]; drawnow %Updates load bar color
        end 
        for i = 3:6
            surfs(i) = surf(ax, x(:,:,i), y(:,:,i), z(:,:,i), c(:,:,i), "FaceColor", fc, 'CData',flip(I(height(I)/2:end, 1+round((i-1)*width(I)/6):round(i*width(I)/6), 1:end)), "FaceAlpha", 1, 'EdgeColor', ec);
            load_r = load_r-(1/7);
            generate.BackgroundColor = [load_r 1 0]; drawnow %Updates load bar color
        end 
    end
   
    hold(ax, 'off')
    
    %Remove axis label ticks
    set(ax,'XColor', 'none','YColor','none', 'ZColor', 'none');
    
    %Reset Generate Button
    generate.BackgroundColor = "white"; drawnow
    generate.Text = "Generate";
end