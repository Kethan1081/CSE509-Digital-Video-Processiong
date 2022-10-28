I = imread("~/Documents/inputImages/med.jpg");

Iy = rgb2ycbcr(I);
y = Iy(:,:,1);

s = edge(y,'Sobel');
p = edge(y,'Prewitt');
c = edge(y,'Canny');
l = edge(y,'log');

s = edge(y,'Sobel', 0.05);
p = edge(y,'Prewitt', 0.05);
c = edge(y,'Canny', [0 0.1]);
l = edge(y,'log', 0.0035);

figure;
subplot(2,2,1), imshow(s);
subplot(2,2,2), imshow(p);
subplot(2,2,3), imshow(c);
subplot(2,2,4), imshow(l);
% Iys = Iy;
% Iyp = Iy;
% Iyc = Iy;
% Iyl = Iy;
% 
% Iys(:,:,1) = s;
% Iyp(:,:,1) = p;
% Iyc(:,:,1) = c;
% Iyl(:,:,1) = l;

L = rgb2gray(I);
J = imnoise(L,'gaussian');

s1 = edge(J,'Sobel');
p1 = edge(J,'Prewitt');
c1 = edge(J,'Canny');
l1 = edge(J,'log');

figure;
subplot(2,2,1), imshow(s1);
subplot(2,2,2), imshow(p1);
subplot(2,2,3), imshow(c1);
subplot(2,2,4), imshow(l1);

c2 = edge(J,'Canny', [], 2.1);
l2 = edge(J,'log', [], 2.5);

figure;
subplot(2,2,1), imshow(c2);
subplot(2,2,2), imshow(l2);