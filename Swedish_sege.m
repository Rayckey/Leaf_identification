% Loop though the images
clear all;
close all;
spieces = dir('Swedish Leaf Dataset');

for i = 3:length(spieces)
    images = dir(strcat('.\Swedish Leaf Dataset\',spieces(i).name,'\' ));
    for j = 3:length(images)
        he = imread(strcat('.\Swedish Leaf Dataset\',spieces(i).name,'\',images(j).name));
        %         he = he(1:(size(he,1)-110),1:(size(he,2)-150),:);
        
        cform = makecform('srgb2lab');
        lab_he = applycform(he,cform);
        
        ab = double(lab_he(:,:,2:3));
        nrows = size(ab,1);
        ncols = size(ab,2);
        ab = reshape(ab,nrows*ncols,2);
        
        nColors = 2;
        % repeat the clustering 3 times to avoid local minima
        [cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
            'Replicates',3);
        
        pixel_labels = logical(reshape(cluster_idx,nrows,ncols) -1 );
        
                if sum(sum(pixel_labels)) > 0.67* size(pixel_labels,1)* size(pixel_labels,2)
                    pixel_labels = imcomplement(pixel_labels);
                end
        %         imshow(pixel_labels,[]), title('image labeled by cluster index');
        %         k = waitforbuttonpress
%         segmented_images = cell(1,3);
%         rgb_label = repmat(pixel_labels,[1 1 3]);
%         color = ones(size(he,1),size(he,2));
%         for k = 1:nColors
%             color = ones(size(he,1),size(he,2));
%             color(rgb_label ~= k) = 0;
%             segmented_images{k} = color;
%         end
        
        file_name = images(j).name(1:end-4);
        
        imwrite(pixel_labels,strcat('.\Swedish Segemented\',spieces(i).name,'\',file_name,'1.png'))
        %         imwrite(segmented_images{2},strcat('.\Swedish Segemented\',spieces(i).name,'\',file_name,'2.png'))
        %         imwrite(segmented_images{3},strcat('.\Swedish Segemented\',spieces(i).name,'\',file_name,'3.png'))
        
    end
end