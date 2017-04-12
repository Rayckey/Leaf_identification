% Loop though the images
clear all;
close all;
spieces = dir('Swedish Leaf Dataset');
species = dir('Swedish Stemless');

for i = 3:length(spieces)
    images = dir(strcat('.\Swedish Segemented\',spieces(i).name,'\' ));
    for j = 3:length(images)
        he = imread(strcat('.\Swedish Segemented\',spieces(i).name,'\',images(j).name));
         IM2 = stemremove(he);

        imwrite(IM2,strcat('.\Swedish Stemless\',species(i).name,'\',images(j).name));

        % imshow(IM2)

    end
end