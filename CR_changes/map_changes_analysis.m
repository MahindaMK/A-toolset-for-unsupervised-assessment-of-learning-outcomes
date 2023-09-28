% ---------------------------------------------------------------------------------------
% This analysis is based on the study by
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

% This file analyses changes in cognitive maps in terms of the
% existence/non-existence, positive-negative/negative-positive, and most
% consistence causal relationships from the beginning to the end maps. 

clear all; close all; clc

% initialization of overall maps (map1 & map2 for beginning & end maps, respectively).
map1 = [];
map2 = [];

% Load the maps data
% Group 1 data in the beginning
map1(:,:,1) = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,2) = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,3) = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,4) = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,5) = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 1 data in the end
map2(:,:,1) = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,2) = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,3) = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,4) = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,5) = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 2 data in the beginning
map1(:,:,6) = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,7) = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,8) = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-03','Range','J9:AX49');

% Group 2 data in the end
map2(:,:,6) = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,7) = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,8) = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_3','Range','J9:AX49');

% Group 3 data in the beginning
map1(:,:,9)  = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,10) = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,11) = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,12) = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,13) = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 3 data in the end
map2(:,:,9)  = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,10) = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,11) = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,12) = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,13) = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 4 data in the beginning
map1(:,:,14) = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,15) = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,16) = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,17) = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,18) = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 4 data in the end
map2(:,:,14) = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,15) = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,16) = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,17) = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,18) = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 6 data in the beginning
map1(:,:,19) = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,20) = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,21) = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,22) = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,23) = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 6 data in the end
map2(:,:,19) = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,20) = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,21) = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,22) = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,23) = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 7 data in the beginning
map1(:,:,24) = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,25) = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,26) = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,27) = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-04','Range','J9:AX49');

% Group 7 data in the end
map2(:,:,24) = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,25) = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,26) = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,27) = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 8 data in the beginning
map1(:,:,28) = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,29) = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,30) = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,31) = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,32) = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 8 data in the end
map2(:,:,28) = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,29) = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,30) = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,31) = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,32) = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 9 data in the beginning
map1(:,:,33) = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,34) = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,35) = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,36) = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,37) = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 9 data in the end
map2(:,:,33) = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,34) = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,35) = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,36) = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,37) = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 10 data in the beginning
map1(:,:,38) = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,39) = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,40) = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,41) = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-04','Range','J9:AX49');

% Group 10 data in the end
map2(:,:,38) = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,39) = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,40) = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,41) = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_4','Range','J9:AX49');

% Group 5 data in the beginning
map1(:,:,42) = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,43) = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,44) = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,45) = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,46) = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 5 data in the end
map2(:,:,42) = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,43) = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,44) = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,45) = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,46) = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 11 data in the beginning
map1(:,:,47) = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,48) = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-02','Range','J9:AX49');

% Group 11 data in the end
map2(:,:,47) = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,48) = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_2','Range','J9:AX49');

% Group 12 data in the beginning
map1(:,:,49) = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,50) = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,51) = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,52) = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,53) = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 12 data in the end
map2(:,:,49) = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,50) = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,51) = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,52) = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,53) = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 13 data in the beginning
map1(:,:,54) = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,55) = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,56) = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,57) = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-04','Range','J9:AX49');

% Group 13 data in the end
map2(:,:,54) = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,55) = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,56) = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,57) = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_4','Range','J9:AX49');

% Group 14 data in the beginning
map1(:,:,58) = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,59) = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,60) = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,61) = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 14 data in the end
map2(:,:,58) = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,59) = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,60) = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,61) = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 15 data in the beginning
map1(:,:,62) = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,63) = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,64) = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,65) = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,66) = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 15 data in the end
map2(:,:,62) = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,63) = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,64) = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,65) = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,66) = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Group 16 data in the beginning
map1(:,:,67) = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','J9:AX49');
map1(:,:,68) = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-02','Range','J9:AX49');
map1(:,:,69) = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-03','Range','J9:AX49');
map1(:,:,70) = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-04','Range','J9:AX49');
map1(:,:,71) = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-05','Range','J9:AX49');

% Group 16 data in the end
map2(:,:,67) = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','J9:AX49');
map2(:,:,68) = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_2','Range','J9:AX49');
map2(:,:,69) = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_3','Range','J9:AX49');
map2(:,:,70) = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_4','Range','J9:AX49');
map2(:,:,71) = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_5','Range','J9:AX49');

% Note that the actual names of the group have been changed now as group 1, group 2,..., 
% to hide them from the published data. In line with the actual names, the group data 
% is loaded into the file to maintain the provided figures' consistency in the submitted paper. 
% This means there is no issue loading "Group 5" after the 10th group data. 

[n,m,p] = size(map1); 
% n, m - number of strategic topics (=41), p - number of maps 

%% Overall analysis of exist/non-exist and non-exist/exist causal relations in the beginning and the end

his1 = cr_frequencies(map1); % all frequencies of each causal relation in the beginning
his2 = cr_frequencies(map2); % all frequencies of each causal relation in the end

% saving the frequencies of all causal relationships [which have at least one non-zero frequency
% in the beginning OR the end map] considering strenght values [-3, -2, -1, 0, 1, 2, 3]

cr_changes('Results/CR_frequencies_beg_end.xlsx', his1, his2, 1);

% saving the frequencies of each causal relationship that exists(non-exists) in the beginning but 
% non-exists(exists) in the end, considering strenght values [-3, -2, -1, 0, 1, 2, 3]
cr_changes('Results/CR_frequencies_10_01.xlsx', his1, his2, 2);


% the file "CR_frequencies_beg_end" gives the information about causal
% relationships that have at least one non-zero frequency in the beginning
% map or the end map. This result file is used to select most robust causal
% relationships and to investigate the directional changes


% The file "CR_frequencies_10_01" gives information
% about which causal relationships have existed (non-existed) in the
% beginning but disappeared (appeared) at the end. 



%% Individual-level analysis of exist/non-exist and non-exist/exist causal relations in each map in the beginning and at the end

for i=1:p
[ind,b,c] = cr_changes([strcat('Results/crfreq_map',num2str(i)),'.xlsx'],...
            cr_frequencies(map1(:,:,i)),cr_frequencies(map2(:,:,i)),2);
end


% The result file "crfreq_mapi" gives the information about causal
% relationships that exist(non-exist) in the beginning but disapper
% (appear) at the end considering each map




