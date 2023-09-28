function d=Gamma(a,b,gamma)

% The MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

if gamma==0
    d=0;
elseif (gamma==1 & (a==0) & (b==0))
    d=0;
else
    d=1;
end