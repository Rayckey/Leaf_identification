function IM2 = stemremove(he)
% stem removal

he = logical(he);

%fix inverted segmentations
center_win = he(1:5,1:5);
if sum(sum(center_win)) > 2
    he = imcomplement(he);
end

he= imfill(he,'holes');
orig = he;
SE = strel('disk',12);
he = imtophat(he,SE);
he = bwareafilt(he,1);

% imshow(he)
% k = waitforbuttonpress;
IM2 = orig - he;
end
