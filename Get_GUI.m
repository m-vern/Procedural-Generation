function Get_GUI()
    global GUI;
    GUI = uifigure('WindowState','maximized');
    GUI.Name = "Procedural Shape Generator";

    GUI_grid = uigridlayout(GUI);
    GUI_grid.RowHeight = {'1x'};
    GUI_grid.ColumnWidth = {'1x', '3x'};

    control_panel = uigridlayout(GUI_grid);
    control_panel.RowHeight = {'0.13x', 65, '0.25x', '0.5x', '0.25x', '0.5x', '0.25x', '0.5x', '0.25x', '0.5x', '0.25x' '0.5x', '.25x', '.25x', '.25x'};
    control_panel.ColumnWidth = {'1x'};
    
    gpu_lbl = uilabel(control_panel, 'FontWeight', 'bold', 'FontSize', 13);
    
    processor_group = uibuttongroup(control_panel,'Position',[0 50 0 50]);
    processor_group.Title = "Select Processor";

    CPU = uiradiobutton(processor_group, 'Position',[10 25 100 15]);
    GPU = uiradiobutton(processor_group, 'Position',[10 5 100 15]);
    GPU.Text = "GPU";
    CPU.Text = "CPU";
    
    if (gpuDeviceCount > 0)
        gpu = gpuDevice;
        gpu_lbl.Text = "GPU Available: " + gpu.Name;
        gpu_lbl.FontColor = [0.2 1 0.2];
    else
        gpu_lbl.Text = "No GPU Available";
        gpu_lbl.FontColor = [1 0 0];
        GPU.Enable = 'off'
    end

    slider_1_lbl = uilabel(control_panel, 'Text', "Resolution");
    shape_resolution = uislider(control_panel, 'Limits', [1 200]);

    slider_2_lbl = uilabel(control_panel, 'Text', "Size");
    shape_size = uislider(control_panel);
    
    slider_3_lbl = uilabel(control_panel, 'Text', "Noise Amp 1");
    amplitude_1 = uislider(control_panel);

    slider_4_lbl = uilabel(control_panel, 'Text', "Noise Amp 2");
    amplitude_2 = uislider(control_panel);

    slider_5_lbl = uilabel(control_panel, 'Text', "Flatten Height");
    flatten_height = uislider(control_panel, 'Limits', [0.1 1.1]);
    
    texture_dropdown_lbl = uilabel(control_panel, 'Text',"Surface Texture");
    global texture_dropdown
    texture_dropdown = uidropdown(control_panel, 'Items', {'Height Map', 'Moon', 'Mars', 'Ice', 'Rocky', 'Stars'});
    
    global generate
    generate = uibutton(control_panel, 'Text', "Generate", 'FontWeight', 'bold', 'FontSize', 13,'ButtonPushedFcn', @(generate,event) generate_MouseDown(generate, shape_resolution, shape_size, amplitude_1, amplitude_2, flatten_height));
    
    global ax;
    ax = axes('parent', GUI_grid, "Color",'none');
end
