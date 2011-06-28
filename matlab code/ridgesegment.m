% RIDGESEGMENT - Normalises fingerprint image and segments ridge region
%
% Function identifies ridge regions of a fingerprint image and returns a
% mask identifying this region.  It also normalises the intesity values of
% the image so that the ridge regions have zero mean, unit standard
% deviation.
%
% This function breaks the image up into blocks of size blksze x blksze and
% evaluates the standard deviation in each region.  If the standard
% deviation is above the threshold it is deemed part of the fingerprint.
% Note that the image is normalised to have zero mean, unit standard
% deviation prior to performing this process so that the threshold you
% specify is relative to a unit standard deviation.
%
% Usage:   [normim, mask, maskind] = ridgesegment(im, blksze, thresh)
%
% Arguments:   im     - Fingerprint image to be segmented.
%              blksze - Block size over which the the standard
%                       deviation is determined (try a value of 16).
%              thresh - Threshold of standard deviation to decide if a
%                       block is a ridge region (Try a value 0.1 - 0.2)
%              margin - No. of pixels to consider as margin in the image.
%
% Returns:     normim - Image where the ridge regions are renormalised to
%                       have zero mean, unit standard deviation.
%              mask   - Mask indicating ridge-like regions of the image, 
%                       0 for non ridge regions, 1 for ridge regions. The
%                       inside on boundry equal to margin are also set to 0
%              maskind - Vector of indices of locations within the mask. 
%
% Suggested values for a 500dpi fingerprint image:
%
%   [normim, mask, maskind] = ridgesegment(im, 16, 0.1)
%
% See also: RIDGEORIENT, RIDGEFREQ, RIDGEFILTER

% Original version by Peter Kovesi,  January 2005
% Reworked by Saurabh Kumar          June 2011
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in


function [normim, mask, maskind] = ridgesegment(im, blksze, thresh, margin)
    
    im = normalise(im,0,1);  % normalise to have zero mean, unit std dev
    
    %im = imadjust(im);  % this is also an option for normalization
    
    fun = inline('std(x(:))*ones(size(x))');
    
    stddevim = blkproc(im, [blksze blksze], fun);
    
    mask = stddevim > thresh;
    
    %set zero at the boundary
    if nargin == 4
        [w,h] = size(mask);
        mask(1:margin,:)=0;
        mask(:,1:margin)=0;
        mask(:,h-margin+1:h)=0;
        mask(w-margin+1:w,:)=0;
    end
    
    maskind = find(mask);
    
    % Renormalise image so that the *ridge regions* have zero mean, unit
    % standard deviation.
    im = im - mean(im(maskind));
    normim = im/std(im(maskind));    
