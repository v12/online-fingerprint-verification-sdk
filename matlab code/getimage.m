% GETIMAGE - invokes image dialog box for interactive image loading
%
% Usage:  [im, filename] = getimage(title, disp, c)
%
% Arguments:
%          title - optional title that will be shown in the GUI window 
%           disp - optional flag 1/0 that results in image being displayed
%              c - optional flag 1/0 that results in imcrop being invoked 
% Returns:
%             im - image
%       filename - filename of image
% 
% Saurabh Kumar         
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in
%
% June 2011

function [im, filename] = getimage(title, disp, c)

    if ~exist('title','var'), title = 'Select an Image:';     end
    if ~exist('disp','var'),  disp = 0;  end
    if ~exist('c','var'),     c = 0;     end
    
    [imagefile1 , pathname]= uigetfile('*.bmp;*.BMP;*.tif;*.TIF;*.jpg',title); 
    if imagefile1 ~= 0 
        cd(pathname);
        im=imread(char(imagefile1));
    end;
    
    if imagefile1 == 0
        im = [];
        filename = [];
        return;
    end;
    
    
    if c
        fprintf('Crop a section of the image\n')
        figure(99), clf, im = imcrop(im); delete(99)
    end
    
    if disp
        show(im, 99);
    end