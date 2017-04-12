% Loop though the images
clear all;
close all;
spieces = dir('dataset\images\lab\');

for i = 3:length(spieces)
    images = dir(strcat('dataset\images\lab\',spieces(i).name,'\' ));
    for j = 3:length(images)
        he = imread(strcat('.\dataset\images\lab\',spieces(i).name,'\',images(j).name));
%         he = he(1:(size(he,1)-110),1:(size(he,2)-150),:);
        
        he = leave_segmentation(he)
        %         imshow(pixel_labels,[]), title('image labeled by cluster index');
%         k = waitforbuttonpress
        imwrite(pixel_labels,strcat('.\dataset\segmented\lab\',spieces(i).name,'\',images(j).name))
        
    end
end