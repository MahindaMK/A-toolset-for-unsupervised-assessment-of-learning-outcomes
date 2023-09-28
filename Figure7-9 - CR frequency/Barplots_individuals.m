% ---------------------------------------------------------------------------------------
% This bar plotting is based on the study by
% "Kumbure, M. M., Tarkiainen, A., Stoklasa, J., Luukka, P., and Jantunen, A. (2023) 
% Causal maps in the analysis and unsupervised assessment of the development of 
% expert knowledge: quantification of the learning effects for knowledge 
% management purposes. Expert Systems with Applications" 

% MATLAB code and the data are presented in the paper: 
% Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) 
% A toolset for unsupervised assessment of learning outcomes 
% submitted to the Software Impacts journal.

% Created by Mahinda Mailagaha Kumbure
% ---------------------------------------------------------------------------------------

clear all; close all; clc

% load data of individual CR frequencies
indFrequency_0_1 = xlsread('Individual_CR_changes.xlsx','Sheet1','B2:B72');
indFrequency_1_0 = xlsread('Individual_CR_changes.xlsx','Sheet1','C2:C72');

% Note that the file "Individual_CR_changes.xlsx" was created using the
% result generated in the analysis in the folder "CR_changes," where map
% changes were studied at individual level. The values in the "Individual_CR_changes.xlsx"
% are the total cases reported in the results of each "crfreq_map1" 
% "crfreq_map1," "crfreq_map2," ....  


% create the bar plots
figure(1)
x = 1:71;
ylim([0 30])
xlim([0.5 71.5])
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
b = bar(x,indFrequency_0_1, 'EdgeColor',[0 0 0],'LineWidth',1)
set(b,'FaceColor',[49/255,130/255,189/255]);
xlabel('Individual','Fontsize',13,'Interpreter','Latex')
ylabel('Frequency of included causal relations','Fontsize',13,'Interpreter','Latex')
xticks([1 5 10 15 20 25 30 35 40 45 50 55 60 65 71])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',13)

saveas(gcf,'frequency_0_1.eps')

figure(2)
x = 1:71;
ylim([0 30])
xlim([0.5 71.5])
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
b = bar(x,indFrequency_1_0, 'EdgeColor',[0 0 0],'LineWidth',1)
set(b,'FaceColor',[49/255,130/255,189/255]);
xlabel('Individual','Fontsize',13,'Interpreter','Latex')
ylabel('Frequency of excluded causal relations','Fontsize',13,'Interpreter','Latex')
xticks([1 5 10 15 20 25 30 35 40 45 50 55 60 65 71])
a = get(gca,'XTickLabel');
set(gca,'XTickLabel',a,'FontName','Times','fontsize',13)

saveas(gcf,'frequency_1_0.eps')
