function pixel_labels = leave_segmentation(he)


cform = makecform('srgb2lab');
lab_he = applycform(he,cform);

ab = double(lab_he(:,:,2:3));
nrows = size(ab,1);
ncols = size(ab,2);
ab = reshape(ab,nrows*ncols,2);

nColors = 2;
% repeat the clustering 2 times to avoid local minima
[cluster_idx, cluster_center] = kmeans(ab,nColors,'distance','sqEuclidean', ...
    'Replicates',2);

pixel_labels = logical(reshape(cluster_idx,nrows,ncols) -1 );

if sum(sum(pixel_labels)) > 0.5* size(pixel_labels,1)* size(pixel_labels,2)
    pixel_labels = imcomplement(pixel_labels);
end
end
