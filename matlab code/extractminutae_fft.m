% EXTRACTMINUTAE  -  Finds the minutae in a fingerprint image
%
% Function to extract the minutae from the input grayscale image.  The gray
% scale image is 2-dimensional matrix with pixel values ranging from 0-255.
% Minutae contains the x-coordinate, y-coordinate, local ridge orientation
% in radians, minutae type (0=end, 1=bifurcation) and the associated ridge
% number. 
%
% Usages: 
%       minutae = extractminutae(im);
%
% Arguments: 
%       im     -    A 2-D matrix containing grayscale intensity image 
%                   representing a fingerprint having pixels values in the 
%                   range 0-255. Recommened DPI of the image is ~500 DPI.
% Returns:
%       minutae -   A Nx5 matrix = [x y theta associatedridge minutaetype]


function minutae = extractmiutae(im, display) 

% Identify ridge-like regions and normalise image
blksze = 16; thresh = 0.1; margin=20;
[normim, mask] = ridgesegment(im, blksze, thresh, margin);
clear im;   %remove the original image from the memory
show(normim,1);

%show(double(mask).*double(normim), 2, 'ridge region');

% Determine ridge orientations
[orientim, reliability] = ridgeorient(normim, 1, 5, 5);
%plotridgeorient(orientim, 20, im, 2)
%show(reliability,6,'Reliablity')
 
% Determine ridge frequency values across the image
blksze = 36;
[freq, medfreq] = ridgefreq(normim, mask, orientim, blksze, 5, 5, 15);
%show(freq,3,'Frequency Image')

% Actually I find the median frequency value used across the whole
% fingerprint gives a more satisfactory result...
freq = medfreq.*mask;
%midfreq can be appox to 0.1 

%show(freq,3,'Frequency Image')

% Now apply filters to enhance the ridge pattern

%newim = ridgefilter(normim, orientim, freq, 0.5, 0.5, 0);
newim = ridgefilter_fft(normim, 0.5);

show(newim,4,'Enhanced Image');

% Binarise, ridge/valley threshold is 0
%binim = newim > 0;
%clear newim;
binim = newim > 150;

show(binim,5,'Binary Image');

% Display binary image for where the mask values are one and where
% the orientation reliability is greater than 0.5
%show(binim.*mask.*(reliability>0.5), 8,'Reliable image');


% Display the skeletonized fingerprint from the binary image
thinim = ridgethin(1-binim, margin);
show(thinim.*mask.*(reliability>0.5),100,'thin image');
clear binim;

%display all minutae
%1st stage - find all the minutae
[ridgeEnd, ridgeBifurcation, ridgerOrderMap] = findminutae(thinim, orientim, mask.*(reliability>0.5));
%show_minutia(normim, ridgeEnd, ridgeBifurcation);

%2nd stage - remove spurious minutae
[ridgeEnd, ridgeBifurcation] = remove_spurious_minutae(ridgeEnd, ridgeBifurcation, ridgerOrderMap);

% print out x,y,theta(indegrees) to console
minutae = [ridgeEnd;ridgeBifurcation];
% [minutae(:,[1,2])';(minutae(:,3)*180/pi)']'  %displays

if nargin == 2
    if display == 1
        show_minutia(normim, ridgeEnd, ridgeBifurcation, 'Fingerprint Minutaes');
    end
end