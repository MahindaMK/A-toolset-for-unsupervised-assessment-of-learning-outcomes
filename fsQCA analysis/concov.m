function [Consistency, Coverage]=concov(data)
% This function computes the Consistency and Coverage values based on the provided data.

% INPUTS:
    % data: an n x 2 matrix where the first column contains membership degrees to A
    %       and the second column contains membership degrees to B.
    
% OUTPUTS:
    % Consistency: the Consistency value calculated according to Ragin's method.
    % Coverage: the Coverage value calculated according to Ragin's method.

% Created by Jan Stoklasa & Pasi Luukka


% Extract membership degrees to A and B from the input data
A = data(:,1);
B = data(:,2);

% find the intersection of membership degrees for each case
intersection = min([A,B],[],2);

Consistency  = sum(intersection)/sum(A);
Coverage     = sum(intersection)/sum(B);

end