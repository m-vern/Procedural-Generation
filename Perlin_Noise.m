function s = Perlin_Noise(m)
    %% This function generates perlin noise
    s = zeros([m,m,2]);
    w = m;
    i = 0;
    while w > 3
        i = i + 1;
        % The interp3 function is a large bottleneck. It uses up a lot of
        % hardware 
        d = gpuArray(interp3(randn([m,m,2]), i-1, 'spline'));
        s = s + i * d(1:(m), 1:m, 1:2);
        w = w - ceil(w/2 - 1);
    end
    s = (s - min(min(s(:,:)))) ./ (max(max(s(:,:))) - min(min(s(:,:))));
end