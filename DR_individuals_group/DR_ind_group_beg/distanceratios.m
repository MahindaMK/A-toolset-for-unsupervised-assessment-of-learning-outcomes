function [D1,D4,D6,D12,Dmg,D12g1,D12A1,D12A2,Area1,Area2,Dmga]=distanceratios(map1,map2,P1,P2)
% This function computes eight distance ratio measures that have been
% proposed in (Langfield-Smith and Wirth, 1992; Markoczy and Goldberg, 1995; Bergman et al. (2020)).

%--------------------
% The MATLAB code is presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

% Created by Jan Stoklasa & Pasi Luukka

%--------------------

% INPUTS:
% map1: Map A
% map2: Map B 
% P1: Number of concepts used in Map A
% P2: Number of concepts used in Map B

% OUTPUTS:
% D1: Distance ratio from the formula 1 (Langfield-Smith and Wirth, 1992)
% D4: Distance ratio from the formula 4 (Langfield-Smith and Wirth, 1992)
% D6: Distance ratio from the formula 6 (Langfield-Smith and Wirth, 1992)
% D12: Distance ratio from the formula 12 (Langfield-Smith and Wirth, 1992)
% Dmg: Distance ratio from Markoczy and Goldberg formula (Markoczy and Goldberg, 1995)
% D12g1: Generalization 1 of Langfield-Smith and Wirths formula 12. 
%        Takes into account the magnitude of strength. Bergman et al. (2020)
% D12A1: Generalization 2 of Langfield-Smith and Wirths formula 12. 
%        Takes intoa account the areas of the maps.(dx,y)=1 can be
%        exceeded) (Bergman et al., 2020)
% D12A2: Distance ratio from the generalization 2 of Langfield-Smith and Wirths formula 12.
%        Takes intoa account the areas of the maps. (d(x,y)=1 can not be
%        exceeded) (Bergman et al., 2020)
% Area1: Area of nodes in map1
% Area2: Area of nodes in map2
% Dmga: Markoczy and Goldberg + Area (Bergman et al., 2020))

% created by Pasi Luukka & Jan Stoklasa


P   = union(P1,P2)
p   = length(P); %no of elements in distance matrix
pc  = intersect(P1,P2) % common elements
pc1 = length(intersect(P1,P2)) % number of common elements
pu1 = length(P1)-length(intersect(P1,pc));            %number of unique elements in map 1
pu2 = length(P2)-length(intersect(P2,pc));            %number of unique elements in map 2
Ps  = length(P); %no of elements in distance matrix
for i=1:length(map1)
    for j=1:length(map1)
       d(i,j)=abs(sign(map1(i,j))-sign(map2(i,j)));      
    end
end
D1=sum(sum(d))
D4=D1/(2*(Ps^2-Ps)) % formula 4
D6=D1/(2*pc1^2+2*pc1*(pu1+pu2)+pu1^2+pu2^2-(2*pc1+pu1+pu2)) %formula 6
count1=0;
count2=0;
for i=1:length(map1)
    for j=1:length(map1)
        if map1(i,j)==0
            count1=count1+1;
        end
        if map2(i,j)==0
            count2=count2+1;
        end
        a=find(i==pc);
        b=find(j==pc);
        if (size(a,1)==0 | size(b,1)==0)
            astar=sign(map1(i,j));
            bstar=sign(map2(i,j));
        else
            astar=map1(i,j);
            bstar=map2(i,j);
        end
           d2(i,j)=abs(astar-bstar);       
    end
end
Ds=sum(sum(d2))

Ala=length(map1)*length(map1)
Area1=Ala-count1;
Area2=Ala-count2;

D12=Ds/(6*pc1^2+2*pc1*(pu1+pu2)+pu1^2+pu2^2-(6*pc1+pu1+pu2)) % Langfield-Smith and Wirths formula 12

D12A1=Ds/(6*pc1^2+2*pc1*(pu1+pu2)+pu1^2+pu2^2-(6*pc1+pu1+pu2))*((max([Area1, Area2]))/(min([Area1, Area2]))) % Langfield-Smith and Wirths formula 12 + Area information (d(x,y)=1 can be exceeded) 

D12A2=(Ds + abs(Area1-Area2))/(max([Area1, Area2])+6*pc1^2+2*pc1*(pu1+pu2)+pu1^2+pu2^2-(6*pc1+pu1+pu2)) % Langfield-Smith and Wirths formula 12 + Area information (d(x,y)=1 can not be exceeded)


% Markoczy and Goldberg's suggestion:
beta=3;     % maximum strength
sigma=0;    % additional weight for polarity change
alpha=1;    % 1:not comparing the nodes directly influencing themselves, 0:If there are variable amounts of direct self-influence in the matrix. 
gamma=1;    % 0,1 or 2, how to interpret matrix cells for which one of the maps cannot have an arc because of a mismatch of nodes.
epsilon=2;  % number of possible polarities. If no polarity directions are considered (i.e. Laukkanen 1992) then 1

% Only ones interesting in our case: possibly beta and gamma. gamma should
% be applied when only one of the maps has apotential arc between ni and nj
% because the other map is misisng either ni or nj. In LW formulation a
% difference of 1 may be added. The intuitition of this is that if one
% person believes in a particular causal relation, while the other person
% has no such belief.
for i=1:length(map1)
    for j=1:length(map1)
            a=find(i==pc);
            b=find(j==pc);
            Nai=find(i==P1);
            Naj=find(j==P1);
            Nbi=find(i==P2);
            Nbj=find(j==P2);
            astar=map1(i,j);
            bstar=map2(i,j);
        if (i==j & alpha==1)
            diff(i,j)=0;
        elseif astar*bstar<0
           diff(i,j)=abs(astar-bstar)+sigma;
        elseif ((size(a,1)==0 | size(b,1)==0)&  ((size(Nai,1)==1 & size(Naj,1)==1) | (size(Nbi,1)==1 & size(Nbj,1)==1)));
            diff(i,j)=Gamma(astar,bstar,gamma);
        else
           diff(i,j)=abs(astar-bstar);       
        end
    end
end
Diffs=sum(sum(diff))

Dmg=Diffs/((epsilon*beta+sigma)*pc1^2+gammap(gamma)*(2*pc1*(pu1+pu2)+pu1^2+pu2^2)-alpha*((epsilon*beta+sigma)*pc1+gammap(gamma)*(pu1+pu2)))

% Including the area information:

Dmga=(Diffs+ abs(Area1-Area2))/((epsilon*beta+sigma)*pc1^2+gammap(gamma)*(2*pc1*(pu1+pu2)+pu1^2+pu2^2)-alpha*((epsilon*beta+sigma)*pc1+gammap(gamma)*(pu1+pu2))+max([Area1, Area2]))

% Generalization based on distance d=|a-b|/(max(1,|a|,|b|))

for i=1:length(map1)
    for j=1:length(map1)
        a=find(i==pc);
        b=find(j==pc);
        if (size(a,1)==0 | size(b,1)==0)
            astar=sign(map1(i,j));
            bstar=sign(map2(i,j));
        else
            astar=map1(i,j);
            bstar=map2(i,j);
%           d2(i,j)=abs(sign(map1(i,j))-sign(map2(i,j)));
        end
           d4(i,j)=abs(astar-bstar)/(max([1 abs(astar) abs(bstar)]));       
    end
end
Dsg=sum(sum(d4))


D12g1=Dsg/(6*pc1^2+2*pc1*(pu1+pu2)+pu1^2+pu2^2-(6*pc1+pu1+pu2)) % Generalization of Langfield-Smith and Wirths formula 12


