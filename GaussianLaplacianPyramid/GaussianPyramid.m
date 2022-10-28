I = imread("~/Documents/HW2_images/multires/calendar.png");
G = rgb2gray(I);
figure;imshow(G);
G = double(G)/255;
Gs = imresize(G,[2^nextpow2(size(I,1)) 2^nextpow2(size(I,2))]);
figure;imshow(Gs);

filter = fspecial('gaussian');
f1 = conv2(Gs, filter, 'same');
%level 1
h0 = Gs - f1;
figure,imshow(h0);

f1s = imresize(f1, 0.5);
figure;imshow(f1s);
%level 2
f2 = conv2(g1s, filter, 'same');
h1 = f1s - f2;

f2s = imresize(f2, 0.5);
figure;imshow(f2s);
%level 3
f3 = conv2(f2s, filter, 'same');
h2 = g2s - f3;
%level 4
f3s = imresize(f3, 0.5);
figure;imshow(f3s);

%Restore Image
p1 = imresize(f3s,2);
r1 = p1 + h2;
figure;imshow(r1);

p2 = imresize(r1,2);
r2 = p2 + h1;
figure;imshow(r2);

p3 = imresize(r2,2);
r3 = p3 + h0;
figure;imshow(r3);


figure;
subplot(2,2,1),imshow(h0, []);
subplot(2,2,2),imshow(h1, []);
subplot(2,2,3),imshow(h2, []);
subplot(2,2,4),imshow(f3s);

figure;
subplot(1,2,1), imshow(Gs);
subplot(1,2,2), imshow(r3);

