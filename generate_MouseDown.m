function generate_MouseDown(generate, resolution, shape_size, amplitude_1, amplitude_2, flatten_height, GPU)
    %% Generate Button On_MouseDown
    % Send GUI inputs/settings to procedural generation
    global res;
    res = round(resolution.Value);
    global size;
    size = round(shape_size.Value);
    global amp_1;
    amp_1 = amplitude_1.Value;
    global amp_2;
    amp_2 = amplitude_2.Value;
    global flatten;
    flatten = flatten_height.Value;
    global generated;
    generated = true;
    global use_GPU;
    use_GPU = GPU.Value;
end
