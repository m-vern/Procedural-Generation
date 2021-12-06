function [x,y,z] = Procedural_Noise(x,y,z,resolution,perlin_amplitude_1,perlin_amplitude_2,flatten_height,g)
    %Get generate button and update status and loading progress color
    global generate
    generate.Text = "Applying Noise...";
    load_y = 0;
    generate.BackgroundColor = [1 load_y 0]; drawnow

    for i = 1:size(x,3)
        p = Perlin_Noise(resolution+1,g).^(1/perlin_amplitude_1);
        x(:,:,i) = x(:,:,i) .* p(:,:,1);
        y(:,:,i) = y(:,:,i) .* p(:,:,1);
        z(:,:,i) = z(:,:,i) .* p(:,:,1);

        load_y = load_y+(1/19);
        generate.BackgroundColor = [1 load_y 0]; drawnow
    end

    for i = 1:size(x,3)
        p = Perlin_Noise(resolution+1,g).^(1/perlin_amplitude_2);
        x(:,:,i) = x(:,:,i) .* p(:,:,1);
        y(:,:,i) = y(:,:,i) .* p(:,:,1);
        z(:,:,i) = z(:,:,i) .* p(:,:,1);
        
        load_y = load_y+(1/19);
        generate.BackgroundColor = [1 load_y 0]; drawnow
    end
end


