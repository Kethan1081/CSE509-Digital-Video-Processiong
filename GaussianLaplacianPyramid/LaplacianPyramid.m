I = imread("~/Documents/HW2_images/bilateral/couple.jpg");
Ig = im2gray(I);
I2 = im2double(Ig);

If = imbilatfilt(I2);
figure;imshow(If);

%Recover Filtered RGB
Iy = rgb2ycbcr(I);
figure;imshow(Iy);
I8B = uint8(255 * If);
Iy(:,:,1) = I8B;
figure;imshow(Iy);

RGB = ycbcr2rgb(Iy);
figure;imshow(RGB);

figure;
subplot(1,2,1), imshow(I);
subplot(1,2,2), imshow(RGB);

If1 = imbilatfilt(I2, 100);
Iy1 = rgb2ycbcr(I);
Iy1(:,:,1) = uint8(255 * If1);
RGB2 = ycbcr2rgb(Iy1);

patch = imcrop(I,[270, 35, 50 50]);
patchVar = std2(patch)^2;
DoS = 2*patchVar;
If2 = imbilatfilt(I2, DoS);
Iy3 = rgb2ycbcr(I);
Iy3(:,:,1) = uint8(255 * If2);
RGB3 = ycbcr2rgb(Iy3);

figure;
subplot(2,2,1), imshow(I);
subplot(2,2,2), imshow(RGB);
subplot(2,2,3), imshow(RGB2);
subplot(2,2,4), imshow(RGB3);

subplot(1,2,1), imshow(If);
subplot(1,2,2), imshow(If2);
Iy1 = rgb2ycbcr(I);
Iy1(:,:,1) = uint8(255 * If1);
RGB2 = ycbcr2rgb(Iy1);
figure;
subplot(2,2,1), imshow(I);
subplot(2,2,2), imshow(RGB);
subplot(2,2,3), imshow(RGB2);
subplot(2,2,4), imshow(RGB3);

patch = imcrop(I,[270, 35, 50 50]);
imshow(patch)
