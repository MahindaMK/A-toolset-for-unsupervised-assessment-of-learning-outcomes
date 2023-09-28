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


% This analysis finds and plot the changes of frequencies of the strategic topics that appeared in 
% the individual starting and end cognitive maps in the original data. Additionally, 
% frequency differences between the end and starting maps are also demonstrated. 


clear all; close all; clc


% Load strategic topics (assigned to P1, P2, ...) used in the beginning maps

% Group 1 data in the beginning
P1 = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P2 = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P3 = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P4 = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P5 = readmatrix('Maps-data/Group1_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 2 data in the beginning
P6 = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P7 = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P8 = readmatrix('Maps-data/Group2_beg.xlsx','Sheet','Map-01','Range','F9:F20');

% Group 3 data in the beginning
P9  = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P10 = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P11 = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P12 = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P13 = readmatrix('Maps-data/Group3_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 4 data in the beginning
P14 = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P15 = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P16 = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P17 = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P18 = readmatrix('Maps-data/Group4_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 5 data in the beginning
P19 = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P20 = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P21 = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P22 = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P23 = readmatrix('Maps-data/Group5_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 6 data in the beginning
P24 = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P25 = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P26 = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P27 = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P28 = readmatrix('Maps-data/Group6_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 7 data in the beginning
P29 = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P30 = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P31 = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P32 = readmatrix('Maps-data/Group7_beg.xlsx','Sheet','Map-01','Range','E9:E20');

% Group 8 data in the beginning
P33 = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P34 = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P35 = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P36 = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P37 = readmatrix('Maps-data/Group8_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 9 data in the beginning
P38 = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P39 = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P40 = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P41 = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P42 = readmatrix('Maps-data/Group9_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 10 data in the beginning
P43 = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P44 = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P45 = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P46 = readmatrix('Maps-data/Group10_beg.xlsx','Sheet','Map-01','Range','E9:E20');


% Group 11 data in the beginning
P47 = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P48 = readmatrix('Maps-data/Group11_beg.xlsx','Sheet','Map-01','Range','G9:G20');

% Group 12 data in the beginning
P49 = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P50 = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P51 = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P52 = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P53 = readmatrix('Maps-data/Group12_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 13 data in the beginning
P54 = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P55 = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P56 = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P57 = readmatrix('Maps-data/Group13_beg.xlsx','Sheet','Map-01','Range','E9:E20');

% Group 14 data in the beginning
P58 = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P59 = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P60 = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P61 = readmatrix('Maps-data/Group14_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 15 data in the beginning
P62 = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P63 = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P64 = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P65 = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P66 = readmatrix('Maps-data/Group15_beg.xlsx','Sheet','Map-01','Range','D9:D20');

% Group 16 data in the beginning
P67 = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','H9:H20');
P68 = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','G9:G20');
P69 = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','F9:F20');
P70 = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','E9:E20');
P71 = readmatrix('Maps-data/Group16_beg.xlsx','Sheet','Map-01','Range','D9:D20');


% Load strategic topics used in the end maps

% Group 1 data in the end
mapka1 = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka2 = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka3 = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka4 = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka5 = readmatrix('Maps-data/Group1_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 2 data in the end
mapka6 = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka7 = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka8 = readmatrix('Maps-data/Group2_end.xlsx','Sheet','2_1','Range','F9:F20');

% Group 3 data in the end
mapka9  = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka10 = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka11 = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka12 = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka13 = readmatrix('Maps-data/Group3_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 4 data in the end
mapka14 = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka15 = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka16 = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka17 = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka18 = readmatrix('Maps-data/Group4_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 5 data in the end
mapka19 = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka20 = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka21 = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka22 = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka23 = readmatrix('Maps-data/Group5_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 6 data in the end
mapka24 = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka25 = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka26 = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka27 = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka28 = readmatrix('Maps-data/Group6_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 7 data in the end
mapka29 = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka30 = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka31 = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka32 = readmatrix('Maps-data/Group7_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 8 data in the end
mapka33 = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka34 = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka35 = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka36 = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka37 = readmatrix('Maps-data/Group8_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 9 data in the end
mapka38 = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka39 = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka40 = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka41 = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka42 = readmatrix('Maps-data/Group9_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 10 data in the end
mapka43 = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka44 = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka45 = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka46 = readmatrix('Maps-data/Group10_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 11 data in the end
mapka47 = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka48 = readmatrix('Maps-data/Group11_end.xlsx','Sheet','2_1','Range','G9:G20');

% Group 12 data in the end
mapka49 = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka50 = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka51 = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka52 = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka53 = readmatrix('Maps-data/Group12_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 13 data in the end
mapka54 = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka55 = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka56 = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka57 = readmatrix('Maps-data/Group13_end.xlsx','Sheet','2_1','Range','E9:E20');

% Group 14 data in the end
mapka58 = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka59 = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka60 = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka61 = readmatrix('Maps-data/Group14_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 15 data in the end
mapka62 = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka63 = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka64 = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka65 = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka66 = readmatrix('Maps-data/Group15_end.xlsx','Sheet','2_1','Range','D9:D20');

% Group 16 data in the end
mapka67 = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','H9:H20');
mapka68 = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','G9:G20');
mapka69 = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','F9:F20');
mapka70 = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','E9:E20');
mapka71 = readmatrix('Maps-data/Group16_end.xlsx','Sheet','2_1','Range','D9:D20');


% combine all information about strategic topics used in the beginning maps
 all_start = [P1; P2; P3; P4; P5; P6; P7; P8; P9; P10; P11; P12; P13; P14; P15; P16;...
     P17; P18; P19; P20; P21; P22; P23; P24; P25; P26; P27; P28; P29; P30; P31; P32;...
     P33; P34; P35; P36; P37; P38; P39; P40; P41; P42; P43; P44; P45; P46;...
     P47; P48; P49; P50; P51; P52; P53; P54; P55; P56; P57; P58; P59; P60; P61; P62;...
     P63; P64; P65; P66; P67; P68; P69; P70; P71];

 % combine all information about strategic topics used in the end maps
 all_end   = [mapka1; mapka2; mapka3; mapka4; mapka5; mapka6; mapka7; mapka8;...
     mapka9; mapka10; mapka11; mapka12; mapka13; mapka14; mapka15; mapka16;...
     mapka17; mapka18; mapka19; mapka20; mapka21; mapka22; mapka23; mapka24;...
     mapka25; mapka26; mapka27; mapka28; mapka29; mapka30; mapka31; mapka32;...
     mapka33; mapka34; mapka35; mapka36; mapka37; mapka38; mapka39; mapka40;...
     mapka41; mapka42; mapka43; mapka44; mapka45; mapka46; mapka47; mapka48;...
     mapka49; mapka50; mapka51; mapka52; mapka53; mapka54; mapka55; mapka56;...
     mapka57; mapka58; mapka59; mapka60; mapka61; mapka62; mapka63; mapka64;...
     mapka65; mapka66; mapka67; mapka68; mapka69; mapka70; mapka71];

 % find frequencies of each startegic topic used in the beginning and end
 % maps

 start_unique = unique(all_start); % unique values in the start
 for i = 1:length(start_unique)
   start_counts(i,1) = sum(all_start==start_unique(i)); % number of times each unique value is repeated
 end
 
 end_unique = unique(all_end); % the unique values in the end
 for i = 1:length(end_unique)
   end_counts(i,1) = sum(all_end==end_unique(i)); % number of times each unique value is repeated
 end
 
 
 data1 = [[start_unique']; [start_counts']];
 data1(:,[1,42])=[]; % "0" and "41" are ignored. "0" shouldn't be included. And also TCSR(41) is also not considered. 
 
 data_start = sortrows(data1',1)';
 
 data2 = [[end_unique']; [end_counts']];
 data2(:,[1])=[]; % "0" is ignored
 data_end = sortrows(data2',1)';
 
 
 % the frequencies of usage of all the strategic issues in the maps provided at the beginning 
 figure(1)
 bar(data_start(2,:),'FaceColor',[0.4660, 0.6740, 0.1880],'EdgeColor',[0.25, 0.25, 0.25],'LineWidth',0.5)
 xticks([1:40])
 ylabel('Frequency', 'Fontsize', 12, 'Interpreter', 'Latex')
 xlabel('ID: Strategic issues', 'Fontsize', 12, 'Interpreter', 'Latex')
 xlim([0 41])
 ylim([0 62])
 grid on
 saveas(gcf,'fig1_a.eps')


 % the frequencies of usage of all the strategic issues in the maps provided at the end 
 figure(2)
 bar(data_end(2,:),'FaceColor',[0, 0.4470, 0.7410],'EdgeColor',[0.25, 0.25, 0.25],'LineWidth',0.5)
 xticks([1:40])
 xlabel('ID: Strategic issues', 'Fontsize', 12, 'Interpreter', 'Latex')
 ylabel('Frequency', 'Fontsize', 12, 'Interpreter', 'Latex')
 xlim([0 41])
 ylim([0 62])
 grid on
 saveas(gcf,'fig1_b.eps')


 % the difference in the total frequency of use of the strategic concepts (positive values mean a larger frequency in the end maps)
 figure(3)
 bar(data_end(2,:)-data_start(2,:),'FaceColor',[1, 0.3, 0.2],'EdgeColor',[0.25, 0.25, 0.25],'LineWidth',0.5)
 xticks([1:40])
 xlabel('ID: Strategic issues', 'Fontsize', 12, 'Interpreter', 'Latex')
 ylabel('Frequency difference', 'Fontsize', 12, 'Interpreter', 'Latex')
 xlim([0 41])
 ylim([-20 20])
 grid on
 saveas(gcf,'fig1_c.eps')



