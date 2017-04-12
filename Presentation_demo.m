% Presentation demo

%% Swedish Dataset (small)
tic;
close all
clear all
clc
load('image_sizes.mat');
load('swedish50.mat')
[C_area,C_contour] = generate_grids();

spieces = dir('Swedish Leaf Dataset\');

img = imread(strcat('.\Swedish Leaf Dataset\',spieces(1+2).name,'\l2nr075.tif'));

figure 
imshow(img)

img = leave_segmentation(img);
figure
imshow(img)
img = stemremove(img); 
figure
imshow(img)

img = im2bw(img);
plate = logical(zeros(5000,5000));
plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;

qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);

classes = compare_hist(qurrey,leavs_lib,spieces,image_sizes,3)
toc
%% Northeastern United States Dataset (large)

tic;

clear all

load('image_sizes.mat');
load('library50_new.mat')
[C_area,C_contour] = generate_grids();
spieces = dir('dataset\images\field\');
img = imread('.\dataset\images\field\acer_ginnala\13291762519532.jpg');

figure 
imshow(img)
img = leave_segmentation(img);
figure
imshow(img)
img = stemremove(img); 
figure
imshow(img)

plate = logical(zeros(1200,1200));
plate(126:(125+size(img,1)),126:(125+size(img,2))) = img;

qurrey = countour_descrip(plate, 'Unknown',C_area,C_contour);

classes = compare_hist(qurrey,leavs_lib,spieces,image_sizes,5)

info = Tree_descriptions(classes{1})
toc