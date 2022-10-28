I = imread("~/Documents/inputImages/geisha.jpg");

Iy = rgb2ycbcr(I);
y1 = Iy(:,:,1);
y = Iy(:,:,1);
%AGC
A = double(min(y(:)));
B = double(max(y(:)));
K = double(256);
alpha = double(double(K-1)/(B-A));
beta = double((-1)*A*(double(K-1)/(B-A)));
y = y1;
for r = 1:size(y, 1)    % for number of rows of the image
    for c = 1:size(y, 2)    % for number of columns of the image
        y1(r,c) = uint8(alpha * double(y(r,c)) + beta);
    end
end


yr = uint8(alpha * double(y) + beta);
Iy1 = Iy;
Iy1(:,:,1) = y1;
figure;
subplot(2,2,1), imhist(y);
subplot(2,2,2), imhist(y1);

rgb = ycbcr2rgb(Iy1);
figure;
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(rgb);
%Histogram equilization

yh = Iy(:,:,1);
yh1 = histeq(yh);
figure;
subplot(1,2,1), imhist(yh);
subplot(1,2,2), imhist(yh1);

Iyh = Iy;
Iyh(:,:,1) = yh1;
rgb1 = ycbcr2rgb(Iyh);
figure;
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(rgb1);

%Adaptive Hist eq
ya = Iy(:,:,1);
ya1 = adapthisteq(ya);
figure;
subplot(1,2,1), imhist(ya);
subplot(1,2,2), imhist(ya1);

Iya = Iy;
Iya(:,:,1) = ya1;
rgb2 = ycbcr2rgb(Iya);
figure;
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(rgb2);
