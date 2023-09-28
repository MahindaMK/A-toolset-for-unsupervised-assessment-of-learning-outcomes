% ---------------------------------------------------------------------------------------
% This distance ratio computation is based on the study by
% "Kumbure, M. M., Tarkiainen, A., Stoklasa, J., Luukka, P., and Jantunen, A. (2023) 
% Causal maps in the analysis and unsupervised assessment of the development of 
% expert knowledge: quantification of the learning effects for knowledge 
% management purposes. Expert Systems with Applications" 

% The MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.
% ---------------------------------------------------------------------------------------


clear all; close all; clc

% This file computes the distance ration between each individual maps and 
% average map in a particular group. 

% load the data from each map
map2=xlsread('Group5_beg.xlsx','Map-02','J9:AX49');
map3=xlsread('Group5_beg.xlsx','Map-03','J9:AX49');
map4=xlsread('Group5_beg.xlsx','Map-04','J9:AX49');
map5=xlsread('Group5_beg.xlsx','Map-05','J9:AX49');

% load the concepts used in each map
P1=xlsread('Group5_beg.xlsx','Map-01','H9:H20');
P2=xlsread('Group5_beg.xlsx','Map-01','G9:G20');
P3=xlsread('Group5_beg.xlsx','Map-01','F9:F20');
P4=xlsread('Group5_beg.xlsx','Map-01','E9:E20');
P5=xlsread('Group5_beg.xlsx','Map-01','D9:D20');

% load the group average map and used concepts
Pka=xlsread('Group5_beg.xlsx','Average','A9:A24');
mapka=xlsread('Group5_beg.xlsx','Average','J9:AX49');

maps(:,:,1)=map1;
maps(:,:,2)=map2;
maps(:,:,3)=map3;
maps(:,:,4)=map4;
maps(:,:,5)=map5;

% compute distance ratios going through each map
for i=1:5
    if i==1
        P=P1;
    elseif i==2
        P=P2;
   elseif i==3
        P=P3;
   elseif i==4
        P=P4;
   elseif i==5
        P=P5;
   elseif i==6
        P=P6;
   elseif i==7
        P=P7;
   end
[D1(i),D4(i),D6(i),D12(i),Dmg(i),D12g1(i),D12A1(i),D12A2(i),Area1(i),Area2(i),Dmga(i)]=distanceratios(maps(:,:,i),mapka,P,Pka)
clear P
end
i=1;

% save distance ratios
writematrix(D12,'DR_group5_beg.xlsx','Range','C3:I3');    % Langfield-Smith and Wirths formula 12
writematrix(D12A2,'DR_group5_beg.xlsx','Range','C4:I4');  % Generalization 2 of Langfield-Smith and Wirths formula 12. Takes intoa account the areas of the maps. (d(x,y)=1 can not be exceeded)
