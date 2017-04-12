clear all; close all; clc

test_img = imread('test_img.png');
figure
imshow(test_img)

% test_img = imbinarize(test_img);

leaf_shape = bwboundaries(test_img,'noholes');



y = linspace(1,size(leaf_shape{1},1),100);

y = int64(y);


sampled_points = leaf_shape{1}(y,:);
% figure
% plot(sampled_points(:,2),sampled_points(:,1))
% axis equal

weights= [];
matches = zeros(1,2);
for i = 1:size(sampled_points,1)
    for j = i:size(sampled_points,1)
        if i == j
            continue
        else
            point1 = sampled_points(i,:);
            point2 = sampled_points(j,:);
            test_line(:,1) = linspace(point1(1), point2(1), 100);
            test_line(:,2) = linspace(point1(2), point2(2), 100);
            out_of_bound = 0;
            for k = 1: 100
                temp_coor = int64(test_line(k,:));
                if test_img(temp_coor(1),temp_coor(2)) == 0
                    out_of_bound = out_of_bound + 1;
                    break;
                end
            end
            
            if out_of_bound <1
                if ismember([i,j], matches,'rows') || ismember([j,i], matches,'rows')
                    continue
                else
                    matches = [matches;i,j];
                    weights = [weights; norm(point1 - point2)];
                end
            end
        end
    end
end
matches(1,:) = [];

DG = sparse(matches(:,1),matches(:,2), weights,100,100);
% [dist,path,pred] = graphshortestpath(DG,1,6);


figure
hold on 
for i = 1: size(matches,1)
    i;
    point1 = sampled_points(matches(i,1),:);
    point2 = sampled_points(matches(i,2),:);
    temp_point = [point1;point2];
    line(temp_point(:,2),temp_point(:,1))
end
plot(leaf_shape{1}(:,2),leaf_shape{1}(:,1),'r')
hold off 
axis equal


%% histogram building 

for i = 1: size(sampled_points,1)
    querry_point= sampled_points(i,:);
    for j = 1: size(sampled_points,1)
        if i == j
            continue
        end
        [dist,path,pred] = graphshortestpath(DG,i,j);
        angle
        
    end
end
    

