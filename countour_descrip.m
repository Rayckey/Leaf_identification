% function will describe the contours using the area and circumference
% within 25 differently sized circles, takes a BW image

function histoFeature = countour_descrip(img, img_location,in_C_area,in_C_contour)
% set up circle convolutions
circle_radii = linspace(5,125,25); % the radii of the 25 different
%circle sizes that will be used
% preallocate for histograms
bins = linspace(0,1,22); % setting up the histogram bins (21 bins each)
areaHisto = zeros(25,21); % 25 histograms by 21 bins
arcHisto = zeros(25,21); % 25 histograms by 21 bins

lin_length = 50;

max_length =0;
BW2 = bwareafilt(img,1);
edge_pts = bwboundaries(BW2,'noholes'); % creates a list of indices of edge pts

boundary_touching = 0;
% for i =1:size(edge_pts{1},1)
%     if edge_pts{1}(i,1) == 126 && edge_pts{1}(i,2) == 126
%         boundary_touching = boundary_touching+1;
%     elseif edge_pts{1}(i,1) == size(img,1)+126 && edge_pts{1}(i,2) == 126
%         boundary_touching = boundary_touching+1;
%     elseif edge_pts{1}(i,1) == size(img,1)+126 && edge_pts{1}(i,2) == size(img,1)+126
%         boundary_touching = boundary_touching+1;
%     elseif edge_pts{1}(i,1) == 126 && edge_pts{1}(i,2) == size(img,1)+126
%         boundary_touching = boundary_touching+1;
%     end
% end
% boundary_touching
% if boundary_touching > 30
%     error
% end

y = linspace(1,size(edge_pts{1},1),lin_length);
y = int64(y);
max_length = size(edge_pts{1},1);
edge_pts_temp = edge_pts{1}(y,:);


img = double(img);
% iterating through the 25 circle scalse
for scale = 1:length(circle_radii)
    C_area = in_C_area{scale}; %creates the filled-in circle in the matrix
    C_contour = in_C_contour{scale}; %creates the perimeter circle in the matrix
    
    % preallocate for histogram
    area = zeros(1, length(edge_pts_temp));
    arcLen = zeros(1, length(edge_pts_temp));
    % iterating through all the edge points at that scale
    for pt = 1:length(edge_pts_temp)
        % create a window of the correct size about each edge point
        centerPt = edge_pts_temp(pt,:);
        R = circle_radii(scale);
        w = double(img(centerPt(1)-R:centerPt(1)+R,...
            centerPt(2)-R:centerPt(2)+R));
        
        % find the area and arclength values for each square
        area(pt) = sum(sum(w.*C_area))/(pi*R^2);
        arcLen(pt)  = sum(sum(w.*C_contour))/(pi*R*2);
    end
    % finding histograms for each scale
    areaHisto(scale,:) = histcounts(area, bins);
    arcHisto(scale,:) = histcounts(arcLen, bins);
end
% return the feature with img identifier, area histogram and the arc
% length histogram
histoFeature = {img_location, areaHisto/lin_length, arcHisto/lin_length};


