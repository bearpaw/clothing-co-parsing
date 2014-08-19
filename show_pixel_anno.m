function show_pixel_anno
% SHOW_PIXEL_ANNO visualization of pixel-level annotations
% Wei YANG 2014
% platero.yang (at) gmail.com
imname = '0006';

load('label_list', 'label_list'); % load label list
load(['annotations/pixel-level/' imname '.mat'], 'groundtruth'); % load an pixel-level annotation

im = imread(['photos/' imname '.jpg']);    % original image

% get image-level labels name
cur_labels = unique(groundtruth);
label_names = cell(1, length(cur_labels));
for i = 1:length(cur_labels)
    label_names(i) = label_list( cur_labels(i)+1 );
end

f = figure;
colors = colormap( jet(length(label_list)) );   % set color map

% % 1. show original photo
subplot(1, 3, 1);  imshow(im); hold on; title('Original'); 

% % 2. visualize annotation
gt_image = zeros(size(groundtruth, 1), size(groundtruth, 2), 3);

for labelidx = 1:length(cur_labels)
    [rows cols] = find(groundtruth == cur_labels(labelidx));
    
    curcolor = colors(cur_labels(labelidx)+1, :);
    for i=1:length(rows)
        gt_image(rows(i), cols(i), 1) = curcolor(1);
        gt_image(rows(i), cols(i), 2) = curcolor(2);
        gt_image(rows(i), cols(i), 3) = curcolor(3);
    end
end

subplot(1, 3, 2); 
imshow(gt_image); hold on; title('Ground Truth'); 

% % 3. visualize legend
subplot(1, 3, 3); 
axis off; hold on; % show off the axis 
for i=1:length(cur_labels)
    [rows cols] = find(groundtruth == cur_labels(i));
    plot(cols, rows, 's', 'MarkerEdgeColor', 'k', 'MarkerFaceColor', colors(cur_labels(i)+1, :), 'MarkerSize', 10, 'visible', 'off');
end
set(gca, 'Ydir', 'reverse'); hold off;
legend(label_names, 'Location', 'West');
pause; close all;
end




