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

% This file plots the variations of distance ratio differences between
% start and end maps. For this analysis, we first calculate the distance ratios 
% from the individual-level maps (from those within the group) to the group level 
% maps considering the whole data sample[this calculation and the resulted 
% distance ratios can be found in the folder "DR_individuals-group"]. Subsequently, 
% we considered the differences in calculated distance ratios (internal diversity) 
% between at end and the beginning for each individual and then averaged those 
% differences at the group level [this calculation and the resulted distance ratios 
% can be found in the folder "DR difference at group-level"]. 


clear all; close all; clc

% Load distance ratio differences (DR1 and DR2) between groups in the beginning and at the end
LSWF_dis4 = xlsread('Mean_results_DR_difference.xlsx','C3:R3'); % Langfield-Smith and Wirths Formula
G2LS_dis4 = xlsread('Mean_results_DR_difference.xlsx','C4:R4'); % Generalization 2 of Langfield-Smith

% Note that the "Mean_results_DR_difference.xlsx" was created using the
% mean distances at group level collected in the folder "DR difference at group-level"]
% Corresponding total cumulative shareholder return is used as the
% performance measure after the simulation process. More information can be
% found the paper


% Create Figure 1
figure(1)
ylim([-0.1 0.1])
xlim([1,16]); hold on
plot(LSWF_dis4,'r-o','LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',...
     'r', 'MarkerFaceColor', 'r'); hold on
plot(G2LS_dis4,'b-s','LineWidth',2,'MarkerSize',7,'MarkerEdgeColor',...
     'b', 'MarkerFaceColor', 'b'); hold on
grid on
xlabel('Group','Fontsize',13,'FontName','Times New Roman');
ylabel('DR differences','Fontsize',13,'Interpreter','Latex');
xticks([1:16])
r = [0.1:0.1:16];
y = zeros(length(r),1);
plot(r,y,'.k'); hold on
legend({'$DR_1$','$DR_2$',''},'Fontsize',13,'Interpreter','Latex');

saveas(gcf,'DR_difference_grps.eps')
