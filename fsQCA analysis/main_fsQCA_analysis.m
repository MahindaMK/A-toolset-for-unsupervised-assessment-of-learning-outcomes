% ---------------------------------------------------------------------------------------
% This fsQCA analysis is based on the study by
% "Kumbure, M. M., Tarkiainen, A., Stoklasa, J., Luukka, P., and Jantunen, A. (2023) 
% Causal maps in the analysis and unsupervised assessment of the development of 
% expert knowledge: quantification of the learning effects for knowledge 
% management purposes. Expert Systems with Applications" 

% MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

% Created by Mahinda Mailagaha Kumbure, Jan Stoklasa, & Pasi Luukka. 
% ---------------------------------------------------------------------------------------


clear all; close all; clc

% load map data
% map1: data of all maps in the beginning
% map2: data of all maps in the end


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

% Get the dimensions of the map data (rows, columns, and number of maps)
[n,m,p] = size(map1); 

%% fsQCA analysis 1: 
% This analysis is to evaluate the hypotheses presented in the paper (see Table 2)
% regarding the changes of individual maps. Detailed description about this
% analysis can be found in the paper

 % loop through each map
 for k=1:p 
    index1 = []; % A in the A-->B causal relationship
    index2 = []; % B in the A-->B causal relationship
    weights1 = []; % strenght value in the beginning
    weights2 = []; % strenght value in the end

    % collect only non-zero cases in the beginning and end
    for i=1:n
        for j=1:m
            if (map1(i,j,k)~=0 || map2(i,j,k)~=0) 
            index1 = [index1 i];
            index2 = [index2 j];
            weights1 = [weights1 map1(i,j,k)];
            weights2 = [weights2 map2(i,j,k)];
            end
        end
    end

    all = [index1' index2' weights1' weights2']; % shows associated CRs in the map i and 
                                                 % corresponding strength values
    
    % calculate trapezoidal memberships for negative (N), zero (0), and positive (P) 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), weights1);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), weights1);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]), weights1);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3,-3,-1,0]), weights2);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]), weights2);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0,1,3,3]), weights2);
    
    % collecting memberships for each hypothesis
    data1 = [memb_std1_start_P' memb_std1_end_P']; % positive to positive
    data2 = [memb_std1_start_P' memb_std1_end_0']; % positive to zero
    data3 = [memb_std1_start_P' memb_std1_end_N']; % positive to negative
    data4 = [memb_std1_start_0' memb_std1_end_P']; % zero to positive
    data5 = [memb_std1_start_0' memb_std1_end_0']; % zero to zero
    data6 = [memb_std1_start_0' memb_std1_end_N']; % zero to negative
    data7 = [memb_std1_start_N' memb_std1_end_P']; % negative to positive
    data8 = [memb_std1_start_N' memb_std1_end_0']; % negative to zero
    data9 = [memb_std1_start_N' memb_std1_end_N']; % negative to negative

    % caculate consistency and coverage value for each hypothesis
    [Consistency1(k), Coverage1(k)]=concov(data1);
    [Consistency2(k), Coverage2(k)]=concov(data2);
    [Consistency3(k), Coverage3(k)]=concov(data3);
    [Consistency4(k), Coverage4(k)]=concov(data4);
    [Consistency5(k), Coverage5(k)]=concov(data5);
    [Consistency6(k), Coverage6(k)]=concov(data6);
    [Consistency7(k), Coverage7(k)]=concov(data7);
    [Consistency8(k), Coverage8(k)]=concov(data8);
    [Consistency9(k), Coverage9(k)]=concov(data9);
    
 end

% take average consistency and coverage values. 
% zero-to-zero case is ignored, because it provide no value

ave_fsqca_vals = [mean(Consistency9, 'omitnan') mean(Coverage9,'omitnan') 
                  mean(Consistency8, 'omitnan') mean(Coverage8,'omitnan') 
                  mean(Consistency7, 'omitnan') mean(Coverage7,'omitnan') 
                  mean(Consistency6, 'omitnan') mean(Coverage6, 'omitnan')
                 %mean(Consistency9, 'omitnan') mean(Coverage9, 'omitnan')
                  mean(Consistency4,'omitnan') mean(Coverage4,'omitnan')
                  mean(Consistency3,'omitnan') mean(Coverage3,'omitnan')
                  mean(Consistency2,'omitnan') mean(Coverage2,'omitnan')
                  mean(Consistency1,'omitnan') mean(Coverage1,'omitnan')]
    
    

% save the results
writematrix(ave_fsqca_vals, 'fsQCAresults_changes.xls','Sheet',1,'Range','C2:D9')
writecell({'consistency'},'fsQCAresults_changes.xls','Sheet',1,'range','C1');
writecell({'coverage'},'fsQCAresults_changes.xls','Sheet',1,'range','D1');
writecell({'posi-posi'},'fsQCAresults_changes.xls','Sheet',1,'range','B2');
writecell({'posi-zero'},'fsQCAresults_changes.xls','Sheet',1,'range','B3');
writecell({'posi-neg'},'fsQCAresults_changes.xls','Sheet',1,'range','B4');
writecell({'zero-posi'},'fsQCAresults_changes.xls','Sheet',1,'range','B5');
writecell({'zero-neg'},'fsQCAresults_changes.xls','Sheet',1,'range','B6');
writecell({'neg-posi'},'fsQCAresults_changes.xls','Sheet',1,'range','B7');
writecell({'neg-posi'},'fsQCAresults_changes.xls','Sheet',1,'range','B8');
writecell({'neg-neg'},'fsQCAresults_changes.xls','Sheet',1,'range','B9');


%% fsQCA analysis 2:
% This analysis is to investigate the polarity changes in specific causal
% relationships
    
% As provided in the paper, we focused on the cases:
% (1) 15-->16
% (2) 16-->37
% (3) 21-->2
% (4) 25-->24
% (5) 20-->16
% (6) 40-->34
    
    %%----------------------------------------------------------------------------------
    % case 1: 15-->16

    idx1 = 15; 
    idx2 = 16;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps

    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C3')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D3')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C4')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D4')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C5')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D5')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C6')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D6')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C7')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D7')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C8')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D8')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C9')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D9')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C10')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D10')

    writecell({'15-->16'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B2');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','C2');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','D2');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B3');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B4');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B5');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B6');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B7');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B8');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B9');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B10');

    %%----------------------------------------------------------------------------------
    % case 2: 
    idx1 = 16; 
    idx2 = 37;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps
    
    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    % Calculate consistency and coverage values for each hypothesis
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G3')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H3')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G4')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H4')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G5')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H5')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G6')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H6')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G7')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H7')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G8')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H8')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G9')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H9')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G10')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H10')

    writecell({'16-->37'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F2');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','G2');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','H2');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F3');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F4');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F5');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F6');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F7');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F8');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F9');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F10');
    % there are nan values for some cases, which are referred as 0

    %%----------------------------------------------------------------------------------
    % case 3: 
    idx1 = 21; 
    idx2 = 2;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps
    
    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K3')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L3')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K4')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L4')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K5')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L5')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K6')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L6')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K7')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L7')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K8')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L8')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K9')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L9')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K10')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L10')

    writecell({'21-->2'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J2');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','K2');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','L2');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J3');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J4');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J5');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J6');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J7');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J8');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J9');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J10');

    %%-------------------------------------------------------------------------------

    % case 4: 25-->24

    idx1 = 25; 
    idx2 = 24;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps
    
    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C15')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D15')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C16')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D16')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C17')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D17')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C18')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D18')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C19')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D19')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C20')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D20')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C21')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D21')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','C22')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','D22')

    writecell({'25-->24'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B14');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','C14');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','D14');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B15');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B16');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B17');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B18');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B19');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B20');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B21');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','B22');
    % there are nan values for some cases, which are referred as 0

    %%----------------------------------------------------------------------------------

    % case 5: 
    idx1 = 20; 
    idx2 = 16;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps
    
    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G15')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H15')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G16')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H16')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G17')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H17')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G18')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H18')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G19')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H19')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G20')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H20')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G21')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H21')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','G22')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','H22')

    writecell({'20-->16'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F14');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','G14');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','H14');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F15');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F16');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F17');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F18');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F19');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F20');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F21');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','F22');
    % there are nan values for some cases, which are referred as 0

    %%-------------------------------------------------------------------------------

    % case 4: 40-->34

    idx1 = 40; 
    idx2 = 34;
    
    cr1_beg = squeeze(map1(idx1,idx2,:)); % take all strength values from beginning maps
    cr1_end = squeeze(map2(idx1,idx2,:)); % take all strength values from end maps
    
    % Calculate the membership degrees 
    memb_std1_start_N = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_beg);
    memb_std1_start_0 = evalmf(fismf("trapmf",[-1,0,0,1]), cr1_beg);
    memb_std1_start_P = evalmf(fismf("trapmf",[0, 1, 3, 3]),cr1_beg);

    memb_std1_end_N  = evalmf(fismf("trapmf",[-3, -3, -1, 0]), cr1_end);
    memb_std1_end_0  = evalmf(fismf("trapmf",[-1,0,0,1]),cr1_end);
    memb_std1_end_P  = evalmf(fismf("trapmf",[0, 1, 3, 3]), cr1_end);
    
    % combining memberships in each hypothesis
    data1 = [memb_std1_start_N memb_std1_end_N]; % neg to neg
    data2 = [memb_std1_start_N memb_std1_end_0]; % neg to zero
    data3 = [memb_std1_start_N memb_std1_end_P]; % neg to posi
    data4 = [memb_std1_start_0 memb_std1_end_N]; % zero to negative
    data5 = [memb_std1_start_0 memb_std1_end_P]; % zero to positive
    data6 = [memb_std1_start_P memb_std1_end_N]; % posi to neg
    data7 = [memb_std1_start_P memb_std1_end_0]; % posi to zero
    data8 = [memb_std1_start_P memb_std1_end_P]; % posi to posi
    
    [Consistency1, Coverage1]=concov(data1); % neg to neg
    [Consistency2, Coverage2]=concov(data2); % neg to zero
    [Consistency3, Coverage3]=concov(data3); % neg to posi
    [Consistency4, Coverage4]=concov(data4); % zero to negative
    [Consistency5, Coverage5]=concov(data5); % zero to positive
    [Consistency6, Coverage6]=concov(data6); % posi to neg
    [Consistency7, Coverage7]=concov(data7); % posi to zero
    [Consistency8, Coverage8]=concov(data8); % posi to posi

    % save the results
    writematrix(Consistency1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K15')
    writematrix(Coverage1', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L15')
    writematrix(Consistency2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K16')
    writematrix(Coverage2', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L16')
    writematrix(Consistency3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K17')
    writematrix(Coverage3', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L17')
    writematrix(Consistency4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K18')
    writematrix(Coverage4', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L18')
    writematrix(Consistency5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K19')
    writematrix(Coverage5', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L19')
    writematrix(Consistency6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K20')
    writematrix(Coverage6', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L20')
    writematrix(Consistency7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K21')
    writematrix(Coverage7', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L21')
    writematrix(Consistency8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','K22')
    writematrix(Coverage8', 'fsQCAresults_selectedCR.xls','Sheet',1,'Range','L22')

    writecell({'40-->34'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J14');
    writecell({'consistency'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','K14');
    writecell({'coverage'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','L14');
    writecell({'neg-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J15');
    writecell({'neg-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J16');
    writecell({'neg-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J17');
    writecell({'zero-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J18');
    writecell({'zero-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J19');
    writecell({'posi-neg'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J20');
    writecell({'posi-zero'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J21');
    writecell({'posi-posi'},'fsQCAresults_selectedCR.xls','Sheet',1,'range','J22');
