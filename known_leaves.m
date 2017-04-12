% "Training" Data pre-compute the curvature histograms for each image
% of known leaf species
% Christine Opiekun and Rocky Wang

tic;


% close all
% clear all
% clc
% load('image_sizes.mat');
% load('fields_lib.mat')
% [C_area,C_contour] = generate_grids();
% spieces = dir('dataset\original\field\');
% img = imread('.\dataset\original\field\aesculus_pavi\13033299101999.png');
% % img = im2bw(img);
% plate = logical(zeros(1200,1200));
% plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
%
% qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);
%
% clasie = compare_hist(qurrey,leavs_lib,spieces,image_sizes)


% clear all
% load('fields_lib.mat')
% load('image_sizes.mat');
% spieces = dir('dataset\original\field\');
% [C_area,C_contour] = generate_grids();
% collected = 0;
% errors=0;
% for i = 3:length(spieces)
%     images = dir(strcat('dataset\original\field\',spieces(i).name,'\' ));
%     pick = int64(rand()* (length(images)-2)) +3 ;
%     try
%         img = imread(strcat('.\dataset\original\field\',spieces(i).name,'\',images(pick).name));
%
%         plate = logical(zeros(1200,1200));
%         plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
%
%         qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);
%     catch ME
%         errors = errors +1;
%         continue
%     end
%
%     clasie = compare_hist(qurrey,leavs_lib,spieces,image_sizes);
%
%     if cell2mat(strfind(clasie,spieces(i).name))
%         collected = collected +1;
%     end
% end
% collected / (length(spieces)-errors)


% clear all
%
%
% spieces = dir('dataset\original\field\');
% for i = 3:length(spieces)
%     images = dir(strcat('dataset\original\field\',spieces(i).name,'\' ));
%     spieces(i).name
%     for j = 3:length(images)
%         image_sizes(i-2) = length(images)-2;
%     end
% end



close all
clear all
clc
load('image_sizes.mat');
load('swedish50.mat')
[C_area,C_contour] = generate_grids();
spieces = dir('Swedish Stemless\');
img = imread(strcat('.\Swedish Stemless\',spieces(1+2).name,'\l2nr0751.png'));
img = im2bw(img);
plate = logical(zeros(5000,5000));
plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;

qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);

clasie = compare_hist(qurrey,leavs_lib,spieces,image_sizes)


% clear all
% load('swedish50.mat')
% load('image_sizes.mat');
% spieces = dir('Swedish Stemless\');
% [C_area,C_contour] = generate_grids();
% collected = 0;
% errors=0;
% for i = 3:length(spieces)
%     images = dir(strcat('Swedish Stemless\',spieces(i).name,'\' ));
%     pick = int64(rand()* (length(images)-2)) +3 ;
%     try
%         img = imread(strcat('.\dataset\original\field\',spieces(i).name,'\',images(pick).name));
% 
%         plate = logical(zeros(1200,1200));
%         plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;
% 
%         qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);
%     catch ME
%         errors = errors +1;
%         continue
%     end
% 
%     clasie = compare_hist(qurrey,leavs_lib,spieces,image_sizes);
% 
%     if cell2mat(strfind(clasie,spieces(i).name))
%         collected = collected +1;
%     end
% end
% collected / (length(spieces)-errors)



 toc 