% REMOVE_SPURIOUS_MINUTAE - Removes spurious minutae
%
% Function to remove the spurious minutae from the extracted minutae.
% 
% Arguments:
%		final_end	-	list containing the x and y coordinates of the
%                       ridge endings
%		final_branch-	 list containing the x and y coordinates of
%                           the ridge bifurcation
%		ridgeOrderMap	-   image containing the ridges with each ridge
%                           having different value starting with 1.
%
% 
% Returns:
%       final_end    -   [x y theta ...] for the end points
% 
%       final_branch -   [x y theta ...] for the bifurcation points
% 
% 
% See Also: FINDMINUTAE
%
% Saurabh Kumar             June 2011
% School of Computer Science & Engineering
% Shri Mata Vaishno Devi University
% saurabh at saurabhworld.in
% http://saurbhworld.in
%
% June 2011

function [final_end, final_branch] = remove_spurious_minutia(ridgeEnd, ridgeBifurcation, ridgeOrderMap, edgeWidth)

if nargin ~= 4
    edgeWidth = 15;			% appoximated [ref. Saurabh]
end

%To store final minutae
final_end = [];
final_branch =[];

ridgeEnd(:,4) = 0;
ridgeBifurcation(:,4) = 1;

%concat all the endings and bifurcations points
minutiaeList = [ridgeEnd;ridgeBifurcation];

finalList = minutiaeList;

[numberOfMinutia,dummy] = size(minutiaeList);

suspectMinList = [];

% Distance based removal, add minuate to suspect list if the distance between then is less
% than edgewidth. (well...edge width can also be estimated to a constant)
for i= 1:numberOfMinutia-1
   for j = i+1:numberOfMinutia
      d =( (minutiaeList(i,1) - minutiaeList(j,1))^2 + (minutiaeList(i,2)-minutiaeList(j,2))^2)^0.5;
      if d < edgeWidth          
         suspectMinList =[suspectMinList;[i,j]];  %add minutia number(position) in the suspected list.
      end;
   end;
end;

[totalSuspectMin, dummy] = size(suspectMinList);
%totalSuspectMin

for k = 1:totalSuspectMin
    m1 = minutiaeList(suspectMinList(k,1),1:4);   %info of minutae 1
    m2 = minutiaeList(suspectMinList(k,2),1:4);   %info of minutae 2
    on_same_ridge = 0;
    if ridgeOrderMap(m1(1), m1(2)) ==  ridgeOrderMap(m2(1),m2(2))
        on_same_ridge = 1;
    end
    
   typesum = m1(4) + m1(4);
   
   if typesum == 1
      % they are branch - end pair
      %if they are on the same ridge, remove both of them
      if on_same_ridge
         finalList(suspectMinList(k,1),1:2) = [-1,-1];
	     %finalList(suspectMinList(k,2),1:2) = [-1,-1];
      end;
      
   elseif typesum == 2
      % they are branch - branch pair
      
      if on_same_ridge
         % two branch are on the same ridge remove one them
         finalList(suspectMinList(k,1),1:2) = [-1,-1];
	     %finalList(suspectMinList(k,2),1:2) = [-1,-1];
      end;
      
   elseif typesum == 0
      % they are end - end pair
      
      if  on_same_ridge         
         finalList(suspectMinList(k,1),1:2) = [-1,-1];
         %finalList(suspectMinList(k,2),1:2) = [-1,-1];      
      else   
         %the connected line between the two points
         thetaC = atan2( m1(1)-m2(1), m1(2)-m2(2) );
         
         angleAB = abs(m1(3)-m2(3));
         angleAC = abs(m1(3)-thetaC);

         if ( (or(angleAB < pi/3, abs(angleAB -pi)<pi/3 )) & (or(angleAC < pi/3, abs(angleAC - pi) < pi/3)) )  
            finalList(suspectMinList(k,1),1:2) = [-1,-1];
            %finalList(suspectMinList(k,2),1:2) = [-1,-1];
         end;
         
      end;
   end;
end;

%prepare the final list
for k =1:numberOfMinutia
    if finalList(k,1:2) ~= [-1,-1]
        if finalList(k,4) == 0
            final_end=[final_end;[finalList(k,1:3)]];
        else
            final_branch=[final_branch;finalList(k,1:3)];
        end;
    end;
end;
