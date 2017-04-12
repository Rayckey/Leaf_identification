% Main Function to creat library
clear all; close all; clc;
addpath dataset


clear all;
close all;
[C_area,C_contour] = generate_grids();
leavs_lib = {};

spieces = dir('Swedish Stemless\');
j = 0;
for i = 3:length(spieces)
    images = dir(strcat('.\Swedish Stemless\',spieces(i).name,'\' ));
    spieces(i).name
    for j = 3:(length(images)-3)
        img = imread(strcat('.\Swedish Stemless\',spieces(i).name,'\',images(j).name));
%         img = im2bw(img);
        plate = logical(zeros(5000,5000));
        plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
        try
            temp_hist = countour_descrip(plate,spieces(i).name,C_area,C_contour);
        catch ME
            continue
        end
        leavs_lib = [leavs_lib;temp_hist];
    end
end
