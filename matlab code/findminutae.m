% FINDMINUTAE - Finds minutae in a fingerprint image
%
% Function to find ridge endings and rigde bifurcations in a given skeletonized
% fingerprint image. Returns the x and y coordinate of all the points found
% to be minutae.
%
% Usage:
%  [ridge_end, ridge_bifurcation] = findminutae(im, mask);
%
% Arguments:
%         im       - The Skeletonized fingerprint Image to be
%                    processed.(see RIDGETHIN)
%         mask     - The binary image containing 0 where the minutae would
%                    invalid.
%         orientim - The orientation image in radians. see RIDGEORIENT          
% 
% Returns:
%         ridge_end    - x and y coordinates of all the ridge end points in
%                        fingerprint
%
%         ridge_bifurcation - x and y coordinates of all the ridge
%                             bifurcation points
%         ridgeOrderMap     - image containing the ridges with each ridge
%                             having different value starting with 1.
%
% See also: RIDGEORIENT, RIDGEFREQ, RIDGESEGMENT, RIDGETHIN
%
% Saurabh Kumar             
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in
%
% June 2011

function [ridge_end, ridge_bifurcation, ridgeOrderMap] = findminutae(im, orientim, mask );

    [w,h] = size(im);

    [ridgeOrderMap, totalRidgeNum] = bwlabel(im); 

    ridge_end    = [];          %initialize to null, then add the points
    ridge_bifurcation = [];     
	
	
    for n=1:totalRidgeNum
        [m,n] = find(ridgeOrderMap==n);
        b = [m,n];
        ridgeW = size(b,1);

        for x = 1:ridgeW
            i = b(x,1);
            j = b(x,2);

            if mask(i,j) == 1

                neiborNum = 0;
                neiborNum = sum(sum(im(i-1:i+1,j-1:j+1)));
                neiborNum = neiborNum - 1;


                if neiborNum == 1
                    ridge_end =[ridge_end; [i,j,orientim(i,j)]];  % Add x,y,theta 

                elseif neiborNum == 3
                    %if two neighbors among the three are connected directly
                    %there may be three braches are counted in the nearing three cells
                    tmp = im(i-1:i+1, j-1:j+1);

                    tmp(2,2)=0;
                    [abr,bbr] = find(tmp==1);
                    t = [abr,bbr];

                    if isempty(ridge_bifurcation)
                        ridge_bifurcation = [ridge_bifurcation;[i,j,orientim(i,j)]];
                    else
                        for p=1:3
                            cbr=find(ridge_bifurcation(:,1)==(abr(p)-2+i) & ridge_bifurcation(:,2)==(bbr(p)-2+j) );
                            if ~isempty(cbr)
                                p=4;
                                break;
                            end;
                        end;

                        if p==3
                            ridge_bifurcation = [ridge_bifurcation;[i,j,orientim(i,j)]];
                        end;

                    end;

                end;

            end;

        end;
    end;