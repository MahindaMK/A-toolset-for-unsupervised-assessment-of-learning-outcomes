% ---------------------------------------------------------------------------------------
% This distance ratio calculation is based on the study by
% "Kumbure, M. M., Tarkiainen, A., Stoklasa, J., Luukka, P., and Jantunen, A. (2023) 
% Causal maps in the analysis and unsupervised assessment of the development of 
% expert knowledge: quantification of the learning effects for knowledge 
% management purposes. Expert Systems with Applications" 

% The MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

% Created by Mahinda Mailagaha Kumbure

% ---------------------------------------------------------------------------------------

% This stuyd first calculate the difference between distance ratios (internal diversity) at end and 
% the beginning for each individual and then average then averaged those 
% differences at the group level. 


clear all; close all; clc

% Load distance ratios from the beginning

% DR1
dr1_Gr1=readmatrix('DR_individuals_group_results/DR_group10_beg.xlsx','Sheet','Distances to group map','range','C3:F3');
dr1_Gr2=readmatrix('DR_individuals_group_results/DR_group2_beg.xlsx','Sheet','Distances to group map','range','C3:E3'); % Here, map 5 is ignored 
dr1_Gr3=readmatrix('DR_individuals_group_results/DR_group3_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr4=readmatrix('DR_individuals_group_results/DR_group4_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr5=readmatrix('DR_individuals_group_results/DR_group5_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr6=readmatrix('DR_individuals_group_results/DR_group6_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr7=readmatrix('DR_individuals_group_results/DR_group7_beg.xlsx','Sheet','Distances to group map','range','C3:F3'); % Although, map 1,2,3,4 were at the biginning, map 2,3,4,5 were at the end. 
dr1_Gr8=readmatrix('DR_individuals_group_results/DR_group8_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr9=readmatrix('DR_individuals_group_results/DR_group9_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr10=readmatrix('DR_individuals_group_results/DR_group1_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr11=readmatrix('DR_individuals_group_results/DR_group11_beg.xlsx','Sheet','Distances to group map','range','C3:D3'); % Here, 3rd map is ignored 
dr1_Gr12=readmatrix('DR_individuals_group_results/DR_group12_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr13=readmatrix('DR_individuals_group_results/DR_group13_beg.xlsx','Sheet','Distances to group map','range','C3:F3'); % Here, 5th map is ignored
dr1_Gr14=readmatrix('DR_individuals_group_results/DR_group14_beg.xlsx','Sheet','Distances to group map','range','C3:F3'); % Here, map 2 is ignored
dr1_Gr15=readmatrix('DR_individuals_group_results/DR_group15_beg.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr16=readmatrix('DR_individuals_group_results/DR_group16_beg.xlsx','Sheet','Distances to group map','range','C3:G3');

DR1_beg = [dr1_Gr1 dr1_Gr2 dr1_Gr3 dr1_Gr4 dr1_Gr5 dr1_Gr6 dr1_Gr7 dr1_Gr8 dr1_Gr9 dr1_Gr10 dr1_Gr11 dr1_Gr12 dr1_Gr13 dr1_Gr14 dr1_Gr15 dr1_Gr16];

% Note that the actual names of the group have been changed now as group 1, group 2,..., 
% to hide them from the published data. In line with the actual names, the group data 
% is loaded into the file to maintain the provided figures' consistency in the submitted paper. 
% This means there is no issue loading "Group 10" in the first. 



% DR2
dr2_Gr1=readmatrix('DR_individuals_group_results/DR_group10_beg.xlsx','Sheet','Distances to group map','range','C4:F4');
dr2_Gr2=readmatrix('DR_individuals_group_results/DR_group2_beg.xlsx','Sheet','Distances to group map','range','C4:E4'); % Here, map 5 is ignored 
dr2_Gr3=readmatrix('DR_individuals_group_results/DR_group3_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr4=readmatrix('DR_individuals_group_results/DR_group4_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr5=readmatrix('DR_individuals_group_results/DR_group5_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr6=readmatrix('DR_individuals_group_results/DR_group6_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr7=readmatrix('DR_individuals_group_results/DR_group7_beg.xlsx','Sheet','Distances to group map','range','C4:F4');   % Although, map 1,2,3,4 were at the biginning, map 2,3,4,5 were at the end. 
dr2_Gr8=readmatrix('DR_individuals_group_results/DR_group8_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr9=readmatrix('DR_individuals_group_results/DR_group9_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr10=readmatrix('DR_individuals_group_results/DR_group1_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr11=readmatrix('DR_individuals_group_results/DR_group11_beg.xlsx','Sheet','Distances to group map','range','C4:D4'); % Here, 3rd map is ignored 
dr2_Gr12=readmatrix('DR_individuals_group_results/DR_group12_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr13=readmatrix('DR_individuals_group_results/DR_group13_beg.xlsx','Sheet','Distances to group map','range','C4:F4'); % Here, 5th map is ignored
dr2_Gr14=readmatrix('DR_individuals_group_results/DR_group14_beg.xlsx','Sheet','Distances to group map','range','C4:F4'); % Here, map 2 is ignored
dr2_Gr15=readmatrix('DR_individuals_group_results/DR_group15_beg.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr16=readmatrix('DR_individuals_group_results/DR_group16_beg.xlsx','Sheet','Distances to group map','range','C4:G4');

DR2_beg = [dr2_Gr1 dr2_Gr2 dr2_Gr3 dr2_Gr4 dr2_Gr5 dr2_Gr6 dr2_Gr7 dr2_Gr8 dr2_Gr9 dr2_Gr10 dr2_Gr11 dr2_Gr12 dr2_Gr13 dr2_Gr14 dr2_Gr15 dr2_Gr16];


% Taking distance ratios data from the end

% DR1
dr1_Gr_end1=readmatrix('DR_individuals_group_results/DR_group10_end.xlsx','Sheet','Distances to group map','range','C3:F3');
dr1_Gr_end2=readmatrix('DR_individuals_group_results/DR_group2_end.xlsx','Sheet','Distances to group map','range','C3:E3');
dr1_Gr_end3=readmatrix('DR_individuals_group_results/DR_group3_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end4=readmatrix('DR_individuals_group_results/DR_group4_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end5=readmatrix('DR_individuals_group_results/DR_group5_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end6=readmatrix('DR_individuals_group_results/DR_group6_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end7=readmatrix('DR_individuals_group_results/DR_group7_end.xlsx','Sheet','Distances to group map','range','C3:F3'); % Here, map 5 is ignored
dr1_Gr_end8=readmatrix('DR_individuals_group_results/DR_group8_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end9=readmatrix('DR_individuals_group_results/DR_group9_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end10=readmatrix('DR_individuals_group_results/DR_group1_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end11=readmatrix('DR_individuals_group_results/DR_group11_end.xlsx','Sheet','Distances to group map','range','C3:D3');
dr1_Gr_end12=readmatrix('DR_individuals_group_results/DR_group12_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end13=readmatrix('DR_individuals_group_results/DR_group13_end.xlsx','Sheet','Distances to group map','range','C3:F3');
dr1_Gr_end14=readmatrix('DR_individuals_group_results/DR_group14_end.xlsx','Sheet','Distances to group map','range','C3:F3'); % But the size of beg maps and end maps are different
dr1_Gr_end15=readmatrix('DR_individuals_group_results/DR_group15_end.xlsx','Sheet','Distances to group map','range','C3:G3');
dr1_Gr_end16=readmatrix('DR_individuals_group_results/DR_group16_end.xlsx','Sheet','Distances to group map','range','C3:G3');

DR1_end = [dr1_Gr_end1 dr1_Gr_end2 dr1_Gr_end3 dr1_Gr_end4 dr1_Gr_end5 dr1_Gr_end6 dr1_Gr_end7 dr1_Gr_end8 dr1_Gr_end9 dr1_Gr_end10 dr1_Gr_end11 dr1_Gr_end12 dr1_Gr_end13 dr1_Gr_end14 dr1_Gr_end15 dr1_Gr_end16];

% DR2
dr2_Gr_end1=readmatrix('DR_individuals_group_results/DR_group10_end.xlsx','Sheet','Distances to group map','range','C4:F4');
dr2_Gr_end2=readmatrix('DR_individuals_group_results/DR_group2_end.xlsx','Sheet','Distances to group map','range','C4:E4');
dr2_Gr_end3=readmatrix('DR_individuals_group_results/DR_group3_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end4=readmatrix('DR_individuals_group_results/DR_group4_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end5=readmatrix('DR_individuals_group_results/DR_group5_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end6=readmatrix('DR_individuals_group_results/DR_group6_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end7=readmatrix('DR_individuals_group_results/DR_group7_end.xlsx','Sheet','Distances to group map','range','C4:F4'); % Here, map 5 is ignored
dr2_Gr_end8=readmatrix('DR_individuals_group_results/DR_group8_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end9=readmatrix('DR_individuals_group_results/DR_group9_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end10=readmatrix('DR_individuals_group_results/DR_group1_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end11=readmatrix('DR_individuals_group_results/DR_group11_end.xlsx','Sheet','Distances to group map','range','C4:D4');
dr2_Gr_end12=readmatrix('DR_individuals_group_results/DR_group12_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end13=readmatrix('DR_individuals_group_results/DR_group13_end.xlsx','Sheet','Distances to group map','range','C4:F4');
dr2_Gr_end14=readmatrix('DR_individuals_group_results/DR_group14_end.xlsx','Sheet','Distances to group map','range','C4:F4'); % But the size of beg maps and end maps are different
dr2_Gr_end15=readmatrix('DR_individuals_group_results/DR_group15_end.xlsx','Sheet','Distances to group map','range','C4:G4');
dr2_Gr_end16=readmatrix('DR_individuals_group_results/DR_group16_end.xlsx','Sheet','Distances to group map','range','C4:G4');

DR2_end = [dr2_Gr_end1 dr2_Gr_end2 dr2_Gr_end3 dr2_Gr_end4 dr2_Gr_end5 dr2_Gr_end6 dr2_Gr_end7 dr2_Gr_end8 dr2_Gr_end9 dr2_Gr_end10 dr2_Gr_end11 dr2_Gr_end12 dr2_Gr_end13 dr2_Gr_end14 dr2_Gr_end15 dr2_Gr_end16];


% Save the differences of distance ratios between data from the beginning and at the end
% and the average distance ratios at group level.

writematrix(dr1_Gr_end10-dr1_Gr10,'DR_difference_results.xlsx','Sheet','Group1','range','C3:G3');
writematrix(dr2_Gr_end10-dr2_Gr10,'DR_difference_results.xlsx','Sheet','Group1','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group1','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group1','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group1','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group1','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group1','range','J2' )
writematrix(mean(dr1_Gr_end10-dr1_Gr10),'DR_difference_results.xlsx','Sheet','Group1','range','J3' )
writematrix(mean(dr2_Gr_end10-dr2_Gr10),'DR_difference_results.xlsx','Sheet','Group1','range','J4' )

writematrix(dr1_Gr_end2-dr1_Gr2,'DR_difference_results.xlsx','Sheet','Group2','range','C3:G3');
writematrix(dr2_Gr_end2-dr2_Gr2,'DR_difference_results.xlsx','Sheet','Group2','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group2','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group2','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group2','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group2','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group2','range','J2' )
writematrix(mean(dr1_Gr_end2-dr1_Gr2),'DR_difference_results.xlsx','Sheet','Group2','range','J3' )
writematrix(mean(dr2_Gr_end2-dr2_Gr2),'DR_difference_results.xlsx','Sheet','Group2','range','J4' )

writematrix(dr1_Gr_end3-dr1_Gr3,'DR_difference_results.xlsx','Sheet','Group3','range','C3:G3');
writematrix(dr2_Gr_end3-dr2_Gr3,'DR_difference_results.xlsx','Sheet','Group3','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group3','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group3','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group3','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group3','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group3','range','J2' )
writematrix(mean(dr1_Gr_end3-dr1_Gr3),'DR_difference_results.xlsx','Sheet','Group3','range','J3' )
writematrix(mean(dr2_Gr_end3-dr2_Gr3),'DR_difference_results.xlsx','Sheet','Group3','range','J4' )

writematrix(dr1_Gr_end4-dr1_Gr4,'DR_difference_results.xlsx','Sheet','Group4','range','C3:G3');
writematrix(dr2_Gr_end4-dr2_Gr4,'DR_difference_results.xlsx','Sheet','Group4','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group4','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group4','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group4','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group4','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group4','range','J2' )
writematrix(mean(dr1_Gr_end4-dr1_Gr4),'DR_difference_results.xlsx','Sheet','Group4','range','J3' )
writematrix(mean(dr2_Gr_end4-dr2_Gr4),'DR_difference_results.xlsx','Sheet','Group4','range','J4' )

writematrix(dr1_Gr_end5-dr1_Gr5,'DR_difference_results.xlsx','Sheet','Group5','range','C3:G3');
writematrix(dr2_Gr_end5-dr2_Gr5,'DR_difference_results.xlsx','Sheet','Group5','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group5','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group5','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group5','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group5','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group5','range','J2' )
writematrix(mean(dr1_Gr_end5-dr1_Gr5),'DR_difference_results.xlsx','Sheet','Group5','range','J3' )
writematrix(mean(dr2_Gr_end5-dr2_Gr5),'DR_difference_results.xlsx','Sheet','Group5','range','J4' )

writematrix(dr1_Gr_end6-dr1_Gr6,'DR_difference_results.xlsx','Sheet','Group6','range','C3:G3');
writematrix(dr2_Gr_end6-dr2_Gr6,'DR_difference_results.xlsx','Sheet','Group6','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group6','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group6','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group6','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group6','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group6','range','J2' )
writematrix(mean(dr1_Gr_end6-dr1_Gr6),'DR_difference_results.xlsx','Sheet','Group6','range','J3' )
writematrix(mean(dr2_Gr_end6-dr2_Gr6),'DR_difference_results.xlsx','Sheet','Group6','range','J4' )

writematrix(dr1_Gr_end7-dr1_Gr7,'DR_difference_results.xlsx','Sheet','Group7','range','C3:G3');
writematrix(dr2_Gr_end7-dr2_Gr7,'DR_difference_results.xlsx','Sheet','Group7','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group7','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group7','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group7','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group7','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group7','range','J2' )
writematrix(mean(dr1_Gr_end7-dr1_Gr7),'DR_difference_results.xlsx','Sheet','Group7','range','J3' )
writematrix(mean(dr2_Gr_end7-dr2_Gr7),'DR_difference_results.xlsx','Sheet','Group7','range','J4' )

writematrix(dr1_Gr_end8-dr1_Gr8,'DR_difference_results.xlsx','Sheet','Group8','range','C3:G3');
writematrix(dr2_Gr_end8-dr2_Gr8,'DR_difference_results.xlsx','Sheet','Group8','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group8','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group8','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group8','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group8','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group8','range','J2' )
writematrix(mean(dr1_Gr_end8-dr1_Gr8),'DR_difference_results.xlsx','Sheet','Group8','range','J3' )
writematrix(mean(dr2_Gr_end8-dr2_Gr8),'DR_difference_results.xlsx','Sheet','Group8','range','J4' )

writematrix(dr1_Gr_end9-dr1_Gr9,'DR_difference_results.xlsx','Sheet','Group9','range','C3:G3');
writematrix(dr2_Gr_end9-dr2_Gr9,'DR_difference_results.xlsx','Sheet','Group9','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group9','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group9','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group9','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group9','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group9','range','J2' )
writematrix(mean(dr1_Gr_end9-dr1_Gr9),'DR_difference_results.xlsx','Sheet','Group9','range','J3' )
writematrix(mean(dr2_Gr_end9-dr2_Gr9),'DR_difference_results.xlsx','Sheet','Group9','range','J4' )

writematrix(dr1_Gr_end1-dr1_Gr1,'DR_difference_results.xlsx','Sheet','Group10','range','C3:G3');
writematrix(dr2_Gr_end1-dr2_Gr1,'DR_difference_results.xlsx','Sheet','Group10','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group10','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group10','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group10','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group10','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group10','range','J2' )
writematrix(mean(dr1_Gr_end1-dr1_Gr1),'DR_difference_results.xlsx','Sheet','Group10','range','J3' )
writematrix(mean(dr2_Gr_end1-dr2_Gr1),'DR_difference_results.xlsx','Sheet','Group10','range','J4' )

writematrix(dr1_Gr_end11-dr1_Gr11,'DR_difference_results.xlsx','Sheet','Group11','range','C3:G3');
writematrix(dr2_Gr_end11-dr2_Gr11,'DR_difference_results.xlsx','Sheet','Group11','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group11','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group11','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group11','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group11','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group11','range','J2' )
writematrix(mean(dr1_Gr_end11-dr1_Gr11),'DR_difference_results.xlsx','Sheet','Group11','range','J3' )
writematrix(mean(dr2_Gr_end11-dr2_Gr11),'DR_difference_results.xlsx','Sheet','Group11','range','J4' )

writematrix(dr1_Gr_end12-dr1_Gr12,'DR_difference_results.xlsx','Sheet','Group12','range','C3:G3');
writematrix(dr2_Gr_end12-dr2_Gr12,'DR_difference_results.xlsx','Sheet','Group12','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group12','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group12','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group12','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group12','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group12','range','J2' )
writematrix(mean(dr1_Gr_end12-dr1_Gr12),'DR_difference_results.xlsx','Sheet','Group12','range','J3' )
writematrix(mean(dr2_Gr_end12-dr2_Gr12),'DR_difference_results.xlsx','Sheet','Group12','range','J4' )

writematrix(dr1_Gr_end13-dr1_Gr13,'DR_difference_results.xlsx','Sheet','Group13','range','C3:G3');
writematrix(dr2_Gr_end13-dr2_Gr13,'DR_difference_results.xlsx','Sheet','Group13','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group13','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group13','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group13','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group13','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group13','range','J2' )
writematrix(mean(dr1_Gr_end13-dr1_Gr13),'DR_difference_results.xlsx','Sheet','Group13','range','J3' )
writematrix(mean(dr2_Gr_end13-dr2_Gr13),'DR_difference_results.xlsx','Sheet','Group13','range','J4' )

writematrix(dr1_Gr_end14-dr1_Gr14,'DR_difference_results.xlsx','Sheet','Group14','range','C3:G3');
writematrix(dr2_Gr_end14-dr2_Gr14,'DR_difference_results.xlsx','Sheet','Group14','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group14','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group14','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group14','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group14','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group14','range','J2' )
writematrix(mean(dr1_Gr_end14-dr1_Gr14),'DR_difference_results.xlsx','Sheet','Group14','range','J3' )
writematrix(mean(dr2_Gr_end14-dr2_Gr14),'DR_difference_results.xlsx','Sheet','Group14','range','J4' )

writematrix(dr1_Gr_end15-dr1_Gr15,'DR_difference_results.xlsx','Sheet','Group15','range','C3:G3');
writematrix(dr2_Gr_end15-dr2_Gr15,'DR_difference_results.xlsx','Sheet','Group15','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group15','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group15','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group15','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group15','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group15','range','J2' )
writematrix(mean(dr1_Gr_end15-dr1_Gr15),'DR_difference_results.xlsx','Sheet','Group15','range','J3' )
writematrix(mean(dr2_Gr_end15-dr2_Gr15),'DR_difference_results.xlsx','Sheet','Group15','range','J4' )

writematrix(dr1_Gr_end16-dr1_Gr16,'DR_difference_results.xlsx','Sheet','Group16','range','C3:G3');
writematrix(dr2_Gr_end16-dr2_Gr16,'DR_difference_results.xlsx','Sheet','Group16','range','C4:G4');
writecell({'Langfield-Smith and Wirths formula 12: '},'DR_difference_results.xlsx','Sheet','Group16','range','B3' )
writecell({'Generalization 2 of Langfield-Smith and Wirths formula 12. Takes into account the areas of the maps. (d(x,y)=1 can not be exceeded)'},...
    'DR_difference_results.xlsx','Sheet','Group16','range','B4' )
writematrix(1:5,'DR_difference_results.xlsx','Sheet','Group16','range','C2:G2' )
writecell({'map number'},'DR_difference_results.xlsx','Sheet','Group16','range','H2' )
writecell({'mean'},'DR_difference_results.xlsx','Sheet','Group16','range','J2' )
writematrix(mean(dr1_Gr_end16-dr1_Gr16),'DR_difference_results.xlsx','Sheet','Group16','range','J3' )
writematrix(mean(dr2_Gr_end16-dr2_Gr16),'DR_difference_results.xlsx','Sheet','Group16','range','J4' )
