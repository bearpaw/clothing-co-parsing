% imlist = dir(['F:\dataset\clothing-co-parsing\data\image-anno\*.mat']);
% 
% for i = 1:length(imlist)
%     i
%     [p name ext] = fileparts(imlist(i).name);
%     load(['F:/dataset/clothing-co-parsing/data/image-anno/' name '.mat']); % photo
%     imwrite(photo.im, sprintf('photos/%.4d.jpg', 1004+i));
%     tags = photo.tags;
%     save(sprintf('annotations/image-level/%.4d.mat', 1004+i), 'tags');
% end


imlist = dir(['F:\dataset\clothing-co-parsing\data\pixel-anno\*.mat']);

for i = 1:length(imlist)
    i
    [p name ext] = fileparts(imlist(i).name);
    load(['F:/dataset/clothing-co-parsing/data/pixel-anno/' name '.mat']); % photo
    im = photo.im;
    superpixel = photo.superpixel;
    labelmap = photo.groundtruth;
    
    groundtruth = zeros(size(superpixel));
    
    uniqsp = unique(superpixel);
    
    for sp = 1:length(uniqsp)
        idx = find(superpixel == uniqsp(sp));
        groundtruth(idx) = labelmap(sp);
    end
    imwrite(photo.im, sprintf('photos/%.4d.jpg', i));
    save(sprintf('annotations/pixel-level/%.4d.mat', i), 'groundtruth');
end