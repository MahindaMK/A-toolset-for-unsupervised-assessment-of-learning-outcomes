function[ind1,b1,c1] = cr_changes(filename,beginInfo,endInfo,k)
% This function creates the Excel file consisteing frequencies of causal
% relationships for each strenght value in the beginning and at the end. 

%------------------------------------------
% The MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

%------------------------------------------


% INPUTS:
    % filename   - name of the excel file that is used to saving results
    % beginInfo  - histogram informations in class matrix for data in the beginning
    % endInfo    - histogram informations in class matrix for data at the end
    % k - specifying the analysis 
        % [k=1 for all causal relationships that have changed from the beginning to the end
        % k=2 for checking existence/non-existence changes of CRs]

% OUTPUTS:
    % ind1 - indices of the matrix of histogram data, which show the different causal relations in the beginning and in the end.
    % b1   - histogram information(in the beginning) which is having causal relations  
    % c1   - histogram information(in the end) which is having causal relations  

[p,n,m] = size(beginInfo);


if k==1 % overall analysis of exist/non-exist and non-exist/exist causal relations in the beginning and the end

    ind1 = [];b1 = [];c1 = [];
    for i=1:n
        for j=1:m
            if (sum(beginInfo(:,i,j)~=endInfo(:,i,j)))~=0 
            ind1 = [ind1; i j]; % Taking indices of histogram data of nodes which are different in the beginning and in the end
            b1 = [b1 beginInfo(:,i,j)];
            c1 = [c1 endInfo(:,i,j)]; 
            end        
        end
    end


    d1 = ind1';
    writecell({'Task 1'},filename,'range','B1');
    writecell({'Indices'},filename,'range','C3');
    writematrix(d1,filename,'range','C4');
    writecell({'row'},filename,'range','B4');
    writecell({'column'},filename,'range','B5');
    writematrix(b1,filename,'range','C8');
    writecell({'Histogram information - in the beginning'},filename,'range','A8');
    writematrix(c1,filename,'range','C16');
    writecell({'Histogram information - in the end'},filename,'range','A16');

    writecell({'(-3)='},filename,'range','B8');
    writecell({'(-2)='},filename,'range','B9');
    writecell({'(-1)='},filename,'range','B10');
    writecell({'0='},filename,'range','B11');
    writecell({'1='},filename,'range','B12');
    writecell({'2='},filename,'range','B13');
    writecell({'3='},filename,'range','B14');

    writecell({'(-3)='},filename,'range','B16');
    writecell({'(-2)='},filename,'range','B17');
    writecell({'(-1)='},filename,'range','B18');
    writecell({'0='},filename,'range','B19');
    writecell({'1='},filename,'range','B20');
    writecell({'2='},filename,'range','B21');
    writecell({'3='},filename,'range','B22');
 
else % to detect existence/non-existence (1-->0 OR 0-->1)
    
    ind1 = [];b1 = [];c1 = [];
    ind2 = [];b2 = [];c2 = [];
    for i=1:n
        for j=1:m
            if (sum(beginInfo(:,i,j)~=endInfo(:,i,j)))~=0 && sum(beginInfo([1,2,3,5,6,7],i,j))==0
            ind1 = [ind1; i j]; % Taking indices of histogram data of nodes which are different in the beginning and in the end
            b1 = [b1 beginInfo(:,i,j)];
            c1 = [c1 endInfo(:,i,j)]; 
            end        
        end
    end

    d1 = ind1';

    for i=1:n
        for j=1:m
            if (sum(beginInfo(:,i,j)~=endInfo(:,i,j)))~=0 && sum(endInfo([1,2,3,5,6,7],i,j))==0
            ind2 = [ind2; i j]; % Taking indices of histogram data of nodes which are different in the beginning and in the end
            b2 = [b2 beginInfo(:,i,j)];
            c2 = [c2 endInfo(:,i,j)]; 
            end        
        end
    end

    d2 = ind2';

    % In the beginning causal relation is considered not to be exisiting
    writecell({'Task 1'},filename,'range','B1');
    writecell({'Indices'},filename,'range','C3');
    writematrix(d1,filename,'range','C4');
    writecell({'row'},filename,'range','B4');
    writecell({'column'},filename,'range','B5');
    writematrix(b1,filename,'range','C8');
    writecell({'Histogram information - in the beginning'},filename,'range','A8');
    writematrix(c1,filename,'range','C16');
    writecell({'Histogram information - in the end'},filename,'range','A16');

    writecell({'(-3)='},filename,'range','B8');
    writecell({'(-2)='},filename,'range','B9');
    writecell({'(-1)='},filename,'range','B10');
    writecell({'0='},filename,'range','B11');
    writecell({'1='},filename,'range','B12');
    writecell({'2='},filename,'range','B13');
    writecell({'3='},filename,'range','B14');

    writecell({'(-3)='},filename,'range','B16');
    writecell({'(-2)='},filename,'range','B17');
    writecell({'(-1)='},filename,'range','B18');
    writecell({'0='},filename,'range','B19');
    writecell({'1='},filename,'range','B20');
    writecell({'2='},filename,'range','B21');
    writecell({'3='},filename,'range','B22');


    % In the beginning causal relation exists but at the end it does not
    writecell({'Task 2'},filename,'range','B25');
    writecell({'Indices'},filename,'range','C26');
    writematrix(d2,filename,'range','C27');
    writecell({'row'},filename,'range','B27');
    writecell({'column'},filename,'range','B28');
    writematrix(b2,filename,'range','C32');
    writecell({'Histogram information - in the beginning'},filename,'range','A32');
    writematrix(c2,filename,'range','C40');
    writecell({'Histogram information - in the end'},filename,'range','A40');

    writecell({'(-3)='},filename,'range','B32');
    writecell({'(-2)='},filename,'range','B33');
    writecell({'(-1)='},filename,'range','B34');
    writecell({'0='},filename,'range','B35');
    writecell({'1='},filename,'range','B36');
    writecell({'2='},filename,'range','B37');
    writecell({'3='},filename,'range','B38');

    writecell({'(-3)='},filename,'range','B40');
    writecell({'(-2)='},filename,'range','B41');
    writecell({'(-1)='},filename,'range','B42');
    writecell({'0='},filename,'range','B43');
    writecell({'1='},filename,'range','B44');
    writecell({'2='},filename,'range','B45');
    writecell({'3='},filename,'range','B46');

end