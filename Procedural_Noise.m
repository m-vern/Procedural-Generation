function [x,y,z] = Procedural_Noise(x,y,z,resolution,perlin_amplitude_1,perlin_amplitude_2,flatten_height)
    %Get generate button and update status and loading progress color
    global generate
    generate.Text = "Applying Noise...";
    load_y = 0;
    generate.BackgroundColor = [1 load_y 0]; drawnow

    for i = 1:2:size(x,3)
        p = Perlin_Noise(resolution+1).^(1/perlin_amplitude_1);
        x(:,:,i) = x(:,:,i) .* p(:,:,1);
        y(:,:,i) = y(:,:,i) .* p(:,:,1);
        z(:,:,i) = z(:,:,i) .* p(:,:,1);
        
        x(:,:,i+1) = x(:,:,i+1) .* p(:,:,2);
        y(:,:,i+1) = y(:,:,i+1) .* p(:,:,2);
        z(:,:,i+1) = z(:,:,i+1) .* p(:,:,2);
        load_y = load_y+(1/19);
        generate.BackgroundColor = [1 load_y 0]; drawnow
    end

    for i = 1:2:size(x,3)
        p = Perlin_Noise(resolution+1).^(1/perlin_amplitude_2);
        x(:,:,i) = x(:,:,i) .* p(:,:,1);
        y(:,:,i) = y(:,:,i) .* p(:,:,1);
        z(:,:,i) = z(:,:,i) .* p(:,:,1);
        
        x(:,:,i+1) = x(:,:,i+1) .* p(:,:,2);
        y(:,:,i+1) = y(:,:,i+1) .* p(:,:,2);
        z(:,:,i+1) = z(:,:,i+1) .* p(:,:,2);
        
        load_y = load_y+(1/19);
        generate.BackgroundColor = [1 load_y 0]; drawnow
    end
end


