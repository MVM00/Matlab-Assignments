%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 1- Go into the Basic_Beamformer function and calculate the RX_delay
% 2- Overwrite speed of sound as 1525 m/s, and compare with the previous
% 3- Reduce the lateral pixel size of the image to pitch/2 or pitch
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clear environment variables and command prompt
clc;
clear;
%% Load RF data and receive parameters
load('RF_Data_128.mat')



%% Set Beamforming parameters
% Question 2:
% Fix the example code given in LAB 8.
% Run the main script called Beamforming_example_MAIN.
% Parameters:
% Elapsed time is 3.782399 seconds.
% Speed of sound c: 1540
% delta_x = pitch/4
% Size of x_axis: 513
% Size of z_axis: 2078
% Change the lateral pixel size of the image to 
% pitch/16, pitch/8, pitch/2 and pitch. Include all 4 figures in you answer sheet.
% Parameters:
% c = 1530, delta_x = pitch/16
% Elapsed time is 16.255170 seconds.
% Speed of sound c: 1530
% delta_x = pitch/16
% Size of x_axis: 2049
% Size of z_axis: 2092
% c = 1530, delta_x = pitch/8
% Elapsed time is 7.578848 seconds.
% Speed of sound c: 1530
% delta_x = pitch/8
% Size of x_axis: 1025
% Size of z_axis: 2092
% c = 1530, delta_x = pitch/2
% Elapsed time is 1.500661 seconds.
% Speed of sound c: 1530
% delta_x = pitch/2
% Size of x_axis: 257
% Size of z_axis: 2092
c = 1540;                       % Speed of sound in the imaging medium (m/s)
z_start = 0;                    % image start point
z_stop = 40e-3;                 % image end point
image_width = N_elements*pitch; % size of the probe 
pitch_denom = 4;
delta_x = pitch/pitch_denom;    % image pixel size in x (lateral direction)
% delta_z = (c/fs)/2            % set inside the beamforming code



%% Beamform
[Beamformed_DATA, z_axis, x_axis] = Basic_Beamformer(RF_data128, z_start, z_stop, image_width, delta_x, pitch, c, fs);
% display quantities and sizes
fprintf('Speed of sound c: %s\n', int2str(c));
fprintf('delta_x = pitch/%s\n', int2str(pitch_denom));
fprintf('Size of x_axis: %s\n', int2str(size(x_axis, 2)));
fprintf('Size of z_axis: %s\n', int2str(size(z_axis, 2)));

% Envelope detection
Beamformed_DATA_env = abs(hilbert(Beamformed_DATA));    
% Log-compression
Beamformed_DATA_dB = 20*log10( Beamformed_DATA_env/max(Beamformed_DATA_env(:)) );   



%% Spatial Filtering - Lateral filtering of features < lambda/2
Beamformed_DATA_filt =  spatial_filter_half_wavelength(Beamformed_DATA, delta_x, c, f0);

% Envelope detection
Beamformed_DATA_filt_env = abs(hilbert(Beamformed_DATA_filt));
% Log-compression
Beamformed_DATA_filt_dB = 20*log10( Beamformed_DATA_filt_env/max(Beamformed_DATA_filt_env(:)) );



%% Plot  

try
    
figure('Position',[100 100 1200 600])
subplot(121)
imagesc(x_axis*1e3, z_axis*1e3, Beamformed_DATA_dB, [-40 0]);
colormap(gray);
colorbar;
title(['B-mode'])
xlabel('Lateral (mm)')
ylabel('Depth (mm)')
axis image
set(gca,'FontSize',14,'Fontname','Arial')

subplot(122)
imagesc(x_axis*1e3, z_axis*1e3, Beamformed_DATA_filt_dB, [-40 0]);
colormap(gray);
colorbar;
title(['B-mode (filtered)'])
xlabel('Lateral (mm)')
ylabel('Depth (mm)')
axis image
set(gca,'FontSize',14,'Fontname','Arial')

catch ME
    disp('Error occurred') % no error found, might be internal to matlab and/or
                            % matlab online incompatibility
end

% Error in matlab.graphics.internal.FigureToolstripManager>@()matlab.graphics.internal.FigureToolstripManager.addGCAInteractions(f,d.Child) (line 586)
%                @(e,d) matlab.graphics.internal.drawnow.callback(@() matlab.graphics.internal.FigureToolstripManager.addGCAInteractions(f, d.Child)));
 