% RIDGETHIN - thins fingerprint image 
%
% Function to thin/skeletonized the fingerprint from an enhanced binary
% image of the fingerprint. The boundary with a given margin-1 pixels is
% clipped off given a well segmented ridges. The margin-1 pixels is used
% because of mask created in RIDGESEGMENT. This is important to avoid 
% detection of minutae at the boundary points.
%
% Usage:
%  newim =  ridgethin(im, margin)
%
% Arguments:
%         im       - Binary Image to be processed.%
%       margin     - The margin along the boundary where the image will be
%                    cliped off.
% 
% Returns:
%         newim    - The thin/skeletonized image.
%
% See also: RIDGEORIENT, RIDGEFREQ, RIDGESEGMENT
%
% Saurabh Kumar             
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in
%
% June 2011

function newim = ridgethin(im, margin)

    % With n = Inf, thins objects to lines. It removes pixels so that an object 
	% without holes shrinks to a minimally connected stroke, and an object with 
	% holes shrinks to a connected ring halfway between each hole and the outer 
	% boundary. This option preserves the Euler number.
	im = bwmorph(im,'thin',Inf);
	
	
	% now clean up the thin image
	im = bwmorph(im,'clean');       % Removes single isolated pixels	
	im = bwmorph(im,'hbreak');		% Removes H-Breaks 	
	newim = bwmorph(im,'spur');     % Removes spikes
	
    % Remove the connected regions at the boundary.
    if nargin == 2
        [w,h] = size(newim);
        newim(1:margin-1,:)=0;
        newim(:,1:margin-1)=0;
        newim(:,h-margin+2:h)=0;
        newim(w-margin+2:w,:)=0;
    end;
				