% ---------------------------------------------------------------------------------------
% This distance ratio plotting is based on the study by
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
% This means there is no issue loading "Group 10" at the first place. 

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


% Plot the individual DRs
figure()
subplot(211)
xlim([1 71])
ylim([0 0.3])
patch([0 4.5 4.5 0],   [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([4.5 7.5 7.5 4.5],   [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([7.5 12.5 12.5 7.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([12.5 17.5 17.5 12.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([17.5 22.5 22.5 17.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([22.5 27.5 27.5 22.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([27.5 31.5 31.5 27.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([31.5 36.5 36.5 31.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([36.5 41.5 41.5 36.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([41.5 46.5 46.5 41.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([46.5 48.5 48.5 46.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([48.5 53.5 53.5 48.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([53.5 57.5 57.5 53.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([57.5 61.5 61.5 57.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([61.5 66.5 66.5 61.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([66.5 71.5 71.5 66.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
hold on 
p1 = plot(DR1_beg, 'r-o','LineWidth',1,'MarkerSize',6,'MarkerEdgeColor','r', 'MarkerFaceColor', 'r')
hold on
p2 = plot(DR1_end, 'b-s','LineWidth',1,'MarkerSize',6,'MarkerEdgeColor','b', 'MarkerFaceColor', 'b')
legend([p1 p2],{'$DR_1$-beginning','$DR_1$-end'},'Fontsize',13,'Interpreter','Latex')
xlabel('Individual','Fontsize',13,'Interpreter','Latex')
ylabel('Distance ratio','Fontsize',13,'Interpreter','Latex')
xticks([1 5 10 15 20 25 30 35 40 45 50 55 60 65 71])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',13)


subplot(212)
xlim([1 71])
ylim([0 0.3])
patch([0 4.5 4.5 0],   [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([4.5 7.5 7.5 4.5],   [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([7.5 12.5 12.5 7.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([12.5 17.5 17.5 12.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([17.5 22.5 22.5 17.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([22.5 27.5 27.5 22.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([27.5 31.5 31.5 27.5],[max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([31.5 36.5 36.5 31.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([36.5 41.5 41.5 36.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([41.5 46.5 46.5 41.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([46.5 48.5 48.5 46.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([48.5 53.5 53.5 48.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([53.5 57.5 57.5 53.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([57.5 61.5 61.5 57.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
patch([61.5 66.5 66.5 61.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,249/255])
patch([66.5 71.5 71.5 66.5], [max(ylim) max(ylim) 0 0], [229/255,245/255,224/255])
hold on 
p1 = plot(DR2_beg, 'r-o','LineWidth',1,'MarkerSize',6,'MarkerEdgeColor','r', 'MarkerFaceColor', 'r')
hold on
p2 = plot(DR2_end, 'b-s','LineWidth',1,'MarkerSize',6,'MarkerEdgeColor','b', 'MarkerFaceColor', 'b')
legend([p1 p2],{'$DR_2$-beginning','$DR_2$-end'},'Fontsize',13,'Interpreter','Latex')
xlabel('Individual','Fontsize',13,'Interpreter','Latex')
ylabel('Distance ratio','Fontsize',13,'Interpreter','Latex')
xticks([1 5 10 15 20 25 30 35 40 45 50 55 60 65 71])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',13)

saveas(gcf,'DR_INDvsGR.eps')


