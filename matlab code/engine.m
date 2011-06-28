template1 = [];
template2 = [];

%get the images for matching
im1 = getimage('Select 1st Fingerprint image');
%im2 = getimage();

%extract the template for the image
display = 1;
%template1 = extractminutae(im1,display)
template1 = extractminutae(im1,display)
save database template1 -compress
%template2 = extractminutae(im2);


%do the verfication and return the percentage match