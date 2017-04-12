% Main Function to creat library
clear all; close all; clc;
addpath dataset

% Read data set
% name = '\../leafsnap-dataset-images.txt';
% file = fopen(name);
% cellR = textscan(file,'%s');
% fclose(file);
% file_names = cellR{1};
%
% file_names(1:5) = [];


% [C_area,C_contour] = generate_grids();
% leavs_lib = {};
% while ~isempty(file_names)
%     file_names{3}
%     img = imread( file_names{3});
%     img = im2bw(img);
%     plate = logical(zeros(1200,1200));
%     plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
%     try
%         file_names(1:6) = [];
%         temp_hist = countour_descrip(plate,file_names{4},C_area,C_contour);
%     catch ME
%         continue
%     end
%     leavs_lib = [leavs_lib;temp_hist];
%
%
% end

clear all;
close all;
[C_area,C_contour] = generate_grids();
leavs_lib = {};

spieces = dir('dataset\original\field\');
j = 0;
for i = 3:length(spieces)
    images = dir(strcat('dataset\original\field\',spieces(i).name,'\' ));
    spieces(i).name
    for j = 3:length(images)-3
        img = imread(strcat('.\dataset\original\field\',spieces(i).name,'\',images(j).name));
%         img = im2bw(img);
        plate = logical(zeros(1200,1200));
        plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
        try
            temp_hist = countour_descrip(plate,spieces(i).name,C_area,C_contour);
        catch ME
            continue
        end
        leavs_lib = [leavs_lib;temp_hist];
        
        
    end
end
