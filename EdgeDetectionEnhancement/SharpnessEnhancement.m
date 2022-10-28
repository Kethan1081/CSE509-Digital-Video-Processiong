I = imread("~/Documents/inputImages/butterfly.jpg");

Iy = rgb2ycbcr(I);
y = Iy(:,:,1);
Iy1 = Iy;
Iy2 = Iy;
Iy3 = Iy;

yd = double(y);
h = fspecial('gaussian',5);
yl = imfilter(yd,h);
% yl = imbilatfilt(y);
B1 = double(2);
B2 = double(4);
B3 = double(8);
ys1 = uint8(yl + B1*(yd - yl));
ys2 = uint8(yl + B2*(yd - yl));
ys3 = uint8(yl + B3*(yd - yl));
% yu = y;
% for r = 1:size(y, 1)    % for number of rows of the image
%     for c = 1:size(y, 2)    % for number of columns of the image
%         yu(r,c) = uint8(double(yl(r,c)) + beta * double(y(r,c) - yl(r,c)));
%     end
% end
Iy1(:,:,1) = ys1;
Iy2(:,:,1) = ys2;
Iy3(:,:,1) = ys3;
rgb1 = ycbcr2rgb(Iy1);
rgb2 = ycbcr2rgb(Iy2);
rgb3 = ycbcr2rgb(Iy3);

figure;
subplot(2,3,1), imshow(y);
subplot(2,3,2), imshow(rgb1);
subplot(2,3,3), imshow(rgb2);
subplot(2,3,4), imshow(rgb3);
subplot(2,3,5), imshow(rgb2);
subplot(2,3,6), imshow(rgb3);

%Qus2

I = imread("~/Documents/inputImages/butterfly.jpg");

Iy = rgb2ycbcr(I);
B1 = double(50);
y = Iy(:,:,1);
cr = Iy(:,:,2);
cb = Iy(:,:,3);

yd = double(y);
crd = double(cr);
cbd = double(cb);
h = fspecial('gaussian',5);
yl = imfilter(yd,h);
crl = imfilter(crd,h);
cbl = imfilter(cbd,h);

ys = uint8(yl + B1*(yd - yl));
crs = uint8(crl + B1*(crd - crl));
cbs = uint8(cbl + B1*(cbd - cbl));
% yu = y;
% cru = cr;
% cbu = cb;
% 
% for r = 1:size(y, 1)    % for number of rows of the image
%     for c = 1:size(y, 2)    % for number of columns of the image
%         yu(r,c) = uint8(double(yl(r,c)) + beta * double(y(r,c) - yl(r,c)));
%         cru(r,c) = uint8(double(crl(r,c)) + beta * double(cr(r,c) - crl(r,c)));
%         cbu(r,c) = uint8(double(cbl(r,c)) + beta * double(cb(r,c) - cbl(r,c)));
%     end
% end

Iy1 = Iy;
Iy1(:,:,1) = ys;
Iy1(:,:,2) = crs;
Iy1(:,:,3) = cbs;

rgb1 = ycbcr2rgb(Iy1);
figure;imshow(rgb1);

figure;
subplot(2,3,1), imshow(y);
subplot(2,3,2), imshow(ys);
subplot(2,3,3), imshow(cr);
subplot(2,3,4), imshow(crs);
subplot(2,3,5), imshow(cb);
subplot(2,3,6), imshow(cbs);
