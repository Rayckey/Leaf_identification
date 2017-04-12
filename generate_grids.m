
function [C_area,C_contour] = generate_grids()

circle_radii = linspace(5,125,25); 

% iterating through the 25 circle scalse
for scale = 1:length(circle_radii)
    %creating a circle convolution window
    [rr, cc] = meshgrid(1:(2*circle_radii(scale) + 1)); %creates the matrix
    C_area{scale} = double(sqrt((rr - (circle_radii(scale) + 1)).^2 + ...
        (cc - (circle_radii(scale) + 1)).^2) <= circle_radii(scale)); %creates the filled-in circle in the matrix
    C_contour{scale} = double(sqrt((rr - (circle_radii(scale) + 1)).^2 + ...
        (cc - (circle_radii(scale) + 1)).^2) == circle_radii(scale)); %creates the perimeter circle in the matrix
end

