function show_image_anno
% SHOW_IMAGE_ANNO visualize image tags
% Wei YANG 2014
% platero.yang (at) gmail.com
fprintf('Press any key to continue. Press Ctrl+Z to quit.')

load('label_list', 'label_list'); % load label list
imlist = dir('annotations/image-level/*.mat'); % browsing annotations

for i = 1:length(imlist)
    fprintf('%d | %d\n', i, length(imlist));
    [p, name, ext] = fileparts(imlist(i).name);
    im = imread(['photos/' name '.jpg']); % original image
    load(['annotations/image-level/' name '.mat'], 'tags'); % image tags
    show_annotation(im, tags, label_list);
end
end


function show_annotation(im, tags, label_list)
% get image-level labels name
label_names = cell(1, length(tags));
for i = 1:length(tags)
    label_names(i) = label_list( tags(i)+1 );
end

f = figure; %scrsz = get(0,'ScreenSize'); set(gcf,'Position',scrsz); % maximize figure window
colormap( jet(length(label_list)) );   % set color map

% % 1. show original photo
subplot(1, 2, 1);  imshow(im); hold on; 

% % 2. show label names
title(sprintf('%s, ', label_names{:})); 
pause; close all;
end




