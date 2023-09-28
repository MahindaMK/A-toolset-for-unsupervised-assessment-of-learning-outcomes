function his = cr_frequencies(map)

%------------------------------------------
% The MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

%------------------------------------------

% This function is to find frequencies of each causal relationship with
% respect to each strength value [-3, -2, -1, 0, 1, 2, 3]

% p - number of maps 
% n, m - number of strategic topics (=41)

[n,m,p] = size(map);

for i=1:n
   for j=1:m        
        his(1,i,j)=0;his(2,i,j)=0;his(3,i,j)=0;his(4,i,j)=0;his(5,i,j)=0;his(6,i,j)=0;his(7,i,j)=0;
    for k=1:p            
        if map(i,j,k)==-3
            his(1,i,j)=his(1,i,j)+1;
        elseif map(i,j,k)==-2
            his(2,i,j)=his(2,i,j)+1;
        elseif map(i,j,k)==-1
            his(3,i,j)=his(3,i,j)+1;
        elseif map(i,j,k)==0
            his(4,i,j)=his(4,i,j)+1;
        elseif map(i,j,k)==1
            his(5,i,j)=his(5,i,j)+1;
        elseif map(i,j,k)==2
            his(6,i,j)=his(6,i,j)+1;
        elseif map(i,j,k)==3
            his(7,i,j)=his(7,i,j)+1;
        end
    end
   end
end