% 1a
I = imread("~/Documents/HW2_images/multires/calendar.png");
size(I)

G = rgb2gray(I);
figure;imshow(G);
G = double(G)/255;

Gs = imresize(G,[2^nextpow2(size(I,1)) 2^nextpow2(size(I,2))]);
size(Gs)
figure;imshow(Gs);

%1b
g0 = Gs;
filter = fspecial('gaussian',5);
figure;imshow(g0);
g1 = conv2(Gs, filter, "same");
g1s = imresize(g1, 0.5);
figure;imshow(g1s);

g2 = conv2(g1s, filter, "same");
g2s = imresize(g2, 0.5);
figure;imshow(g2s);

%1c
filter2 = 1/25 * ones(5);

bc1 = conv2(Gs, filter2, "same");
bc1s = imresize(bc1, 0.5);
figure;imshow(bc1s);

bc2 = conv2(bc1s, filter2, "same");
bc2s = imresize(bc2, 0.5);
figure;imshow(bc2s);