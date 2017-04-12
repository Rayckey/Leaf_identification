function guses = compare_hist(qurrey,hist_collection,spieces,image_sizes, NumRe)

qurrey_hist = qurrey{2};

qurrey_hist2 = qurrey{3};

dist = zeros(1,size(hist_collection,1));
labels = cell(1,size(hist_collection,1));
for i = 1:size(hist_collection,1)
    temp_label = hist_collection{i,1};
    temp_hist = hist_collection{i,2};
    temp_hist2 = hist_collection{i,3};
    for j  = 1:25
        temp_dist(j,:) = min([temp_hist(j,:);qurrey_hist(j,:)]);
    end
    area_dist = 25 - sum(sum(temp_dist));
    for j  = 1:25
        temp_dist2(j,:) = min([temp_hist2(j,:);qurrey_hist2(j,:)]);
    end
    curv_dist = 25 - sum(sum(temp_dist2));

    dist(i) = sqrt(area_dist^2 + curv_dist^2);
    labels{i} =  temp_label;
end

[Dsorted, SortIndex] = sort(dist);
Lsorted = labels(SortIndex);


selected_L = Lsorted(1:NumRe*15);

y = unique(selected_L);
n = zeros(length(y), 1);
guses = {};

while length(guses )< NumRe

for iy = 1:length(y)
    n(iy) = length(find(strcmp(y{iy}, selected_L)));
end
[~, itemp] = max(n);
for iL = 1:length(selected_L)
    if strcmp(selected_L{iL},y(itemp))
        selected_L{iL} =[];
    end
end
guses = [guses,y(itemp)];



% labels = {spieces(3:length(spieces)).name};
% dis_hist = zeros(1,length(spieces)-2);

% qurrey_hist = qurrey{2};
% 
% qurrey_hist2 = qurrey{3};
% 
% for i = 1:size(hist_collection,1)
%     temp_label = hist_collection{i,1};
%     temp_hist = hist_collection{i,2};
%     temp_hist2 = hist_collection{i,3};
%     for j  = 1:25
%         temp_dist(j,:) = min([temp_hist(j,:);qurrey_hist(j,:)])
%     end
%     area_dist = 25 - sum(sum(temp_dist));
%     for j  = 1:25
%         temp_dist2(j,:) = min([temp_hist2(j,:);qurrey_hist2(j,:)]);
%     end
%     curv_dist = 25 - sum(sum(temp_dist2));
%     
%     for f = 1: size(labels,2)
%         if strcmp(labels(f),temp_label)
%             dis_hist(f) = dis_hist(f) + sqrt(area_dist^2 + curv_dist^2);
%         end
%     end
% end
% 
% dis_hist = dis_hist./image_sizes;
% [Dsorted, SortIndex] = sort(dis_hist);
% SortIndex;
% Lsorted = labels(SortIndex);
% selected_L = Lsorted(1:5);


end


