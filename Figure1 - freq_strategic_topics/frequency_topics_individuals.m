% ---------------------------------------------------------------------------------------
% This analysis and plotting is based on the study by
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

% This analysis finds and plot the changes of frequencies of the strategic topics 
% from the starting to the end at individual level. 


clear all; close all; clc

% Load strategic topics used in the beginning maps

% Group 1 data in the beginning
P{1} = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{2} = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{3} = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{4} = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{5} = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 2 data in the beginning
P{6} = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{7} = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{8} = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','F9:F20');

% Group 3 data in the beginning
P{9}  = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{10} = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{11} = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{12} = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{13} = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 4 data in the beginning
P{14} = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{15} = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{16} = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{17} = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{18} = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 5 data in the beginning
P{19} = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{20} = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{21} = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{22} = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{23} = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 6 data in the beginning
P{24} = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{25} = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{26} = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{27} = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{28} = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 7 data in the beginning
P{29} = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{30} = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{31} = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{32} = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','E9:E20');

% Group 8 data in the beginning
P{33} = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{34} = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{35} = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{36} = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{37} = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 9 data in the beginning
P{38} = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{39} = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{40} = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{41} = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{42} = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 10 data in the beginning
P{43} = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{44} = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{45} = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{46} = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','E9:E20');


% Group 11 data in the beginning
P{47} = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{48} = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-01','Range','G9:G20');

% Group 12 data in the beginning
P{49} = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{50} = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{51} = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{52} = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{53} = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 13 data in the beginning
P{54} = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{55} = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{56} = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{57} = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','E9:E20');

% Group 14 data in the beginning
P{58} = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{59} = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{60} = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{61} = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 15 data in the beginning
P{62} = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{63} = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{64} = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{65} = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{66} = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 16 data in the beginning
P{67} = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P{68} = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P{69} = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P{70} = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P{71} = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','D9:D20');


% Load strategic topics used in the end maps

% Group 1 data in the end
mapka{1} = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{2} = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{3} = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{4} = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{5} = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 2 data in the end
mapka{6} = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{7} = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{8} = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','F9:F20');

% Group 3 data in the end
mapka{9}  = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{10} = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{11} = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{12} = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{13} = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 4 data in the end
mapka{14} = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{15} = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{16} = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{17} = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{18} = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 5 data in the end
mapka{19} = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{20} = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{21} = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{22} = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{23} = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 6 data in the end
mapka{24} = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{25} = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{26} = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{27} = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{28} = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 7 data in the end
mapka{29} = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{30} = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{31} = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{32} = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 8 data in the end
mapka{33} = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{34} = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{35} = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{36} = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{37} = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 9 data in the end
mapka{38} = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{39} = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{40} = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{41} = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{42} = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 10 data in the end
mapka{43} = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{44} = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{45} = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{46} = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 11 data in the end
mapka{47} = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{48} = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_1','Range','G9:G20');

% Group 12 data in the end
mapka{49} = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{50} = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{51} = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{52} = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{53} = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 13 data in the end
mapka{54} = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{55} = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{56} = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{57} = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 14 data in the end
mapka{58} = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{59} = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{60} = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{61} = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 15 data in the end
mapka{62} = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{63} = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{64} = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{65}= readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{66} = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 16 data in the end
mapka{67} = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka{68} = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka{69} = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka{70} = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka{71} = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','D9:D20');


% To find what are new and what have been removed
removed_ids  = [];
included_ids = [];

for i=1:71
   x = P{i}; y = mapka{i};

   % to find the ids of the topics that have been removed at the end
   idx_no_change1 = ismember(x,y);
   x(idx_no_change1)=[];
   removed_ids = [removed_ids; x];

   % to find the ids of the topics that have been included at the end
   x = P{i}; y = mapka{i};
   idx_no_change2 = ismember(y,x);
   y(idx_no_change2)=[];
   included_ids = [included_ids; y];

end

 removed_unique = unique(removed_ids); % the unique values in the start
 for i = 1:length(removed_unique)
   removed_counts(i,1) = sum(removed_ids==removed_unique(i)); % number of times each unique value is repeated
 end
 
 included_unique = unique(included_ids); % the unique values in the end
 for i = 1:length(included_unique)
   included_counts(i,1) = sum(included_ids==included_unique(i)); % number of times each unique value is repeated
 end
 

 data1 = [[removed_unique']; [removed_counts']];
 data1(:,[1,42])=[]; % "0" and "41" are ignored. "0" shouldn't be included. And also TCSR(41) is also not considered. 
 data_start = sortrows(data1',1)';
 
 data2 = [[included_unique']; [included_counts']];
 data2(:,[1])=[];  % "0" is ignored
 data_end = sortrows(data2',1)';
 

% This figure provides a more individual-level view of the changes, where 
% all emergences (positive frequencies) and removals (negative frequencies) of the strategic 
% issues are being tracked.


figure(4)
yValues1 = -data_start(2,:);
yValues2 = data_end(2,:);
bar(yValues1, 'FaceColor',[0.9290 0.6940 0.1250],'EdgeColor',[0.25, 0.25, 0.25])
xticks([1:40])
hold on
bar(yValues2, 'FaceColor',[0.3010 0.7450 0.9330],'EdgeColor',[0.25, 0.25, 0.25])
xticks([1:40])
ylabel('No. of students', 'Fontsize', 12, 'Interpreter', 'Latex')
xlabel('ID: Strategic issues', 'Fontsize', 12, 'Interpreter', 'Latex')
grid on
legend('Removed','Included')
xlim([0 41])
saveas(gcf,'fig1_d.eps')

