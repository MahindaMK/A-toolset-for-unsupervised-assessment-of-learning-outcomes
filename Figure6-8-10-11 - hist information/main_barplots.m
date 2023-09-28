% ---------------------------------------------------------------------------------------
% This hitogram plotting is based on the study by
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

% This analysis examines the changes of causal maps as an effect of
% learning in terms of the frequency of causal relationships in the
% beginning and in the end. 

clear all; close all; clc

%% Causal relations that exist in the beginning but don't exist in the end maps - Figure 6

% load data
data = readmatrix('Selected_CR_1_to_0.xlsx');  % This file selecting relevant cases was created 
                                               % using the main file "CR_frequencies_10_01.xlsx" 
                                               % in the analysis in folder "CR_changes."

% define the strength values
x = [-3,-2,-1,1,2,3];

% plot the data
figure(1)
subplot(121)
z     = [data([5,6,7,9,10,11],1:12)];
width = 0.5;
b = bar3(z,width); 
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-33','8-6','9-41','11-34','18-41','21-30','25-27','33-23','34-26','38-12','38-23','39-38'})
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
zlim([0 10])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(a) Frequency of selected causal relations in the beginning','FontWeight','Normal','Fontsize',14)
colorbar('southoutside')
caxis([0 35])

subplot(122)
z = [data([13,14,15,17,18,19],1:12)];
width = 0.5;
b = bar3(z,width);

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-33','8-6','9-41','11-34','18-41','21-30','25-27','33-23','34-26','38-12','38-23','39-38'})
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(b) Frequency of selected causal relations in the end','FontWeight','Normal','Fontsize',14)
zlim([0 10])
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colorbar('southoutside')
caxis([0 35])

saveas(gcf,'beg1end0.eps')


%% Causal relations that don't exist in the beginning but exist in the end maps - Figure 8 

%load data
data = xlsread('Selected_CR_0_to_1.xlsx'); % This file selecting relevant cases was created 
                                           % using the main file "CR_frequencies_10_01.xlsx" 
                                           % in the analysis in folder "CR_changes."

% define the strength values
x = [-3,-2,-1,1,2,3];

figure(2)
subplot(121)
z = [data([5,6,7,9,10,11],1:12)];
width = 0.5;
b = bar3(z,width);
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-12','5-23','9-11','12-21','17-37','18-15','19-15','20-37','23-21','33-11','35-19','38-24'})
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
zlim([0 10])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(a) Frequency of selected causal relations in the beginning','FontWeight','Normal','Fontsize',14)
colorbar('southoutside')
caxis([0 10])

subplot(122)
z = [data([13,14,15,17,18,19],1:12)];
width = 0.5;
b = bar3(z,width);

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-12','5-23','9-11','12-21','17-37','18-15','19-15','20-37','23-21','33-11','35-19','38-24'})
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(b) Frequency of selected causal relations in the end','FontWeight','Normal','Fontsize',14)
zlim([0 10])
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colorbar('southoutside')
caxis([0 10])

saveas(gcf,'beg0end1.eps')


%% Directional changes of causal relationships - Figure 10

% load data
data = xlsread('Selected_CR_-_+.xlsx'); % % This file selecting relevant cases was created 
                                          % using the main result file "CR_frequencies_beg_end.xlsx" 
                                          % in the analysis in folder "CR_changes."

% define the strength values
x = [-3,-2,-1,1,2,3];

figure(3)
subplot(121)
z = [data([5,6,7,9,10,11],1:12)];
width = 0.5;
b = bar3(z,width);
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

% set labels and title for the subplot
set(gca,'XTickLabel',{'15-16','15-23','16-37','19-20','20-16','21-2','25-24','26-12','27-8','32-15','38-39','40-34'}) 
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
zlim([0 7])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(a) Frequency of selected causal relations in the beginning','FontWeight','Normal','Fontsize',14)
colorbar('southoutside')
caxis([0 7])

subplot(122)
z = [data([13,14,15,17,18,19],1:12)];
width = 0.5;
b = bar3(z,width);

% set labels and title for the subplot
set(gca,'XTickLabel',{'15-16','15-23','16-37','19-20','20-16','21-2','25-24','26-12','27-8','32-15','38-39','40-34'})
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(b) Frequency of selected causal relations in the end','FontWeight','Normal','Fontsize',14)
zlim([0 7])
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colorbar('southoutside')
caxis([0 7])
saveas(gcf,'directional_changes.eps')


%% Most robust causal relationships - Figure 11

% load data
data = xlsread('Selected_CR_robust.xlsx'); % This file selecting relevant cases was created 
                                           % using the main result file "CR_frequencies_beg_end.xlsx" 
                                           % in the analysis in folder "CR_changes."

% define the strength values
x = [-3,-2,-1,1,2,3];

figure(4)
subplot(121)
z = [data([5,6,7,9,10,11],1:12)];
width = 0.5;
b = bar3(z,width);
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-41','2-19','12-19','16-41','19-1','19-24','19-41','21-1','21-19','23-41','24-23','24-41'}) 
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
zlim([0 35])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(a) Frequency of selected causal relations in the beginning','FontWeight','Normal','Fontsize',14)
colorbar('southoutside')
caxis([0 35])

subplot(122)
z = [data([13,14,15,17,18,19],1:12)];
width = 0.5;
b = bar3(z,width);

% set labels and title for the subplot
set(gca,'XTickLabel',{'1-41','2-19','12-19','16-41','19-1','19-24','19-41','21-1','21-19','23-41','24-23','24-41'}) 
set(gca,'YTickLabel',[-3,-2,-1,1,2,3])
xlabel('Causal relations','Fontsize',13)
ylabel('Strength values','Fontsize',13)
zlabel('Frequency','Fontsize',13)
title('(b) Frequency of selected causal relations in the end','FontWeight','Normal','Fontsize',14)
zlim([0 35])
for k = 1:length(b)
    zdata = b(k).ZData;
    b(k).CData = zdata;
    b(k).FaceColor = 'interp';
end
colorbar('southoutside')
caxis([0 35])

saveas(gcf,'consistent_CR.eps')

