I = imread("~/Documents/HW04_input.png");
h = fspecial ('average', 5);
D = im2double(rgb2gray(I));  
c = imfilter(D,h,'conv');
y = sum(abs(c(:)).^2)/numel(c);
SNR = 30;
sigma = y / (10^(SNR/10));
N = imnoise(c, 'gaussian', 0, sigma);

H = fft2(h,size(N,1),size(N,2));
Hc = conj(H);

la = fspecial('laplacian', 0.1);
lb = fspecial('laplacian');
lc = fspecial('laplacian', 0.7);
La = fft2(la,size(N,1),size(N,2));
Lb = fft2(lb,size(N,1),size(N,2));
Lc = fft2(lc,size(N,1),size(N,2));

H2 = abs(H).^2;
La2 = abs(La).^2;
Lb2 = abs(Lb).^2;
Lc2 = abs(Lc).^2;

alpha1 = 0.03;
alpha2 = 0.05;
alpha3 = 1;

Num = Hc.*fft2(N);
Denom1 = H2 + alpha1*La2;
Denom2 = H2 + alpha1*Lb2;
Denom3 = H2 + alpha1*Lc2;
Denom4 = H2 + alpha2*La2;
Denom5 = H2 + alpha2*Lb2;
Denom6 = H2 + alpha2*Lc2;
Denom7 = H2 + alpha3*La2;
Denom8 = H2 + alpha3*Lb2;
Denom9 = H2 + alpha3*Lc2;

S1 = real(ifftn(Num./Denom1));
S2 = real(ifftn(Num./Denom2));
S3 = real(ifftn(Num./Denom3));
S4 = real(ifftn(Num./Denom4));
S5 = real(ifftn(Num./Denom5));
S6 = real(ifftn(Num./Denom6));
S7 = real(ifftn(Num./Denom7));
S8 = real(ifftn(Num./Denom8));
S9 = real(ifftn(Num./Denom9));

figure;
subplot(1,3,1), imshow(S1);
subplot(1,3,2), imshow(S2);
subplot(1,3,3), imshow(S3);
figure;
subplot(1,3,1), imshow(S4);
subplot(1,3,2), imshow(S5);
subplot(1,3,3), imshow(S6);
figure;
subplot(1,3,1), imshow(S7);
subplot(1,3,2), imshow(S8);
subplot(1,3,3), imshow(S9);
