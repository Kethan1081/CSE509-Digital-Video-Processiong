I = imread("~/Documents/HW04_input.png");
h = fspecial ('average', 5) ;
D = im2double(rgb2gray(I));  
c = imfilter(D,h,'conv', 'circular');
y = sum(abs(c(:)).^2)/numel(c);
SNR = 30;
sigma = y / (10^(SNR/10));
N = imnoise(c, 'gaussian', 0, sigma);

hf = fft2(h,size(N,1),size(N,2));
Fa = real(ifft2(fft2(N)./hf));
F1 = real(ifft2((abs(hf) > 0.001).*fft2(N)./hf));
F2 = real(ifft2((abs(hf) > 0.01).*fft2(N)./hf));
F3 = real(ifft2((abs(hf) > 0.1).*fft2(N)./hf));
F4 = real(ifft2((abs(hf) > 0.2).*fft2(N)./hf));
F5 = real(ifft2((abs(hf) > 0.25).*fft2(N)./hf));
F6 = real(ifft2((abs(hf) > 0.3).*fft2(N)./hf));
F7 = real(ifft2((abs(hf) > 0.35).*fft2(N)./hf));
figure;
subplot(2,2,1), imshow(D);
subplot(2,2,2), imshow(N);
subplot(2,2,1), imshow(Fa);
subplot(2,2,2), imshow(F1);

figure;
subplot(3,2,1), imshow(F1);
subplot(3,2,2), imshow(F2);
subplot(3,2,3), imshow(F3);
subplot(3,2,4), imshow(F4);
subplot(3,2,5), imshow(F5);
subplot(3,2,6), imshow(F6);