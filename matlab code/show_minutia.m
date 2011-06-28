% SHOW_MINUTIA - Displays the image with all the minuate points
%
% Function to display the minuate points and thier orientation over the
% given fingerprint image. Ridge ending are displayed as star, while rigde
% bifurcations are display as yellow plus(+) sign
%
% Arguments:
%         im       			- 	fingerprint image to be displayed in the background
%		  ridgeEnd          - 	A Nx3 matrix contain x,y and oriention in
%                               radians of ridge endings
%		  ridgeBifurcation  -   A Nx3 matrix contain in x,y and orientation
%                               in radian of ridge bifurcations
%         title             -   (Optional) Displays the image with the
%                               given title
%
% See also: RIDGEORIENT, FREQEST, RIDGESEGMENT, RIDGETHIN, FINDMINUTAE, SHOW
%
% Saurabh Kumar             June 2011
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in
%
% June 2011

function show_minutia(im, ridgeEnd, ridgeBifurcation, title);
%display the fingerprint image in the background;
if nargin == 4
    show(im, title);
else
    show(im);
end
hold on;

%now plot the ridge endings
if ~isempty(ridgeEnd)
	plot(ridgeEnd(:,2),ridgeEnd(:,1),'om',...
        'MarkerSize',5,...
        'LineWidth',1);
end;


%now plot the ridge bifurcations
if ~isempty(ridgeBifurcation)
	hold on
	plot(ridgeBifurcation(:,2),ridgeBifurcation(:,1),'xy',...
        'MarkerSize',5);
end;


%now draw the orientation fields
if size(ridgeEnd,2) == 3
   minutae = [ridgeEnd;ridgeBifurcation];
   lineLength = 15;
   hold on   
   [u,v] = pol2cart(minutae(:,3),lineLength);   %find the offset vector
   quiver(minutae(:,2),minutae(:,1),u,v,0,'.','linewidth',1, 'color','m');
   axis equal, axis ij,  hold off
end;