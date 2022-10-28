% 1a
I = imread("~/Documents/HW04_input.png");
h = fspecial ('average', 5) ;
D = im2double(rgb2gray(I));  
c = imfilter(D,h,'conv', 'circular');
hf = fft2(h,size(c,1),size(c,2));
y = sum(abs(c(:)).^2)/numel(c);
SNR = 30;
sigma = y / (10^(SNR/10));
N = imnoise(c, 'gaussian', 0, sigma);

Fa = real(ifft2(fft2(c)./hf));
Fb = real(ifft2(fft2(N)./hf));

figure;
subplot(2,2,1), imshow(D);
subplot(2,2,2), imshow(c);
subplot(2,2,3), imshow(Fa);
subplot(2,2,4), imshow(Fb);

% 1b
I = imread("~/Documents/HW04_input.png");
h = fspecial ('average', 5) ;
D = im2double(rgb2gray(I));  
c = imfilter(D,h,'conv', 'circular');
y = sum(abs(c(:)).^2)/numel(c);
SNR = 30;
sigma = y / (10^(SNR/10));
N = imnoise(c, 'gaussian', 0, sigma);

psnr_c_D = psnr(c, D);
psnr_N_D = psnr(N, D);
psnr_c_c = psnr(c, c);
psnr_N_c = psnr(N, c);


