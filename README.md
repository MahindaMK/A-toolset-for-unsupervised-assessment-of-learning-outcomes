# A toolset for unsupervised assessment of learning outcomes
A set of tools for evaluating the results and impacts of an educational event, employing cognitive maps as a model for representing cognitive structures or knowledge. 

## Overview
The MATLAB code and the data are presented in the paper: Kumbure, M. M., Stoklasa, J., Luukka, P., Tarkiainen, A. and Jantunen, A. (2023) _A toolset for unsupervised assessment of learning outcomes_ submitted to the Software Impacts journal.The code and data are associated with the paper: Kumbure, M. M., Tarkiainen, A., Stoklasa, J., Luukka, P., and Jantunen, A. (2023) [_Causal maps in the analysis and unsupervised assessment of the development of expert knowledge: quantification of the learning effects for knowledge management purposes_](https://doi.org/10.1016/j.eswa.2023.121232) in the Expert Systems with Applications journal.

Detailed descriptions of each method and analysis can be found in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232). All calculations in the analysis are based on MATLAB and Excel (writing & reading files, specifically).

## Data
The foloder **Maps-data** in the "data" contains the dataset used in study. It includes 71 maps data (in the beginning (71) and at the end (71)) in the form of adjacency matrices collected from cognitive maps over 16 groups. In each group, the number of students varies from 3 to 5. Each adjacency matrices representing the cognitive maps is in the size of 41x41.

## Distance ratio-based assessment
This analysis is based on the  calculation of the distance ratios (DRs) from the individual-level maps (from those within the group) to the group-level maps considering the whole data sample. This analysis can be found in the folder **DR_individuals_group.** In that folder, there two separate sub-folders, one for the beginning maps (**DR beginning maps**) and the other for the end maps (**DR end maps**). In each case, we need to find DRs for each group, in fact you will see Matlab files for each group. Included MATLAB files:

- `DR_groupi_beg_ind_grp.m`: This file computes the distance ratio (`DR`) between each individual (`ind`) map and average (`grp`) map in a particular group (`groupi`) in the beginning (`beg`), where i can be 1, 2,.., 16. 

- `DR_groupi_end_ind_grp.m`: This file computes the distance ratio (`DR`) between each individual (`ind`) map and average (`grp`) map in a particular group (`groupi`) in the end (`end`), where i can be 1, 2,.., 16. 

- `distanceratios.m`: This function is used to compute DRs in each case. 

- `Gamma.m`: This function is used to compute the parameter value of Markoczy and Goldberg's distance ratio measure. 

- `gammap.m`: This function is used to compute the parameter value of Generalization of Langfield-Smith and Wirths formula 12. 

The resulted DRs are stored in the folder **DR_ind_group_results** in "results." 

Next, we consider the differences in the calculated distance ratios (in the previous step) between at end and the beginning for each individual and then averaged those differences at the group level. This analysis can be found in the MATLAB file `DR_diffence_group_level.m` in the "code." 
This file first loads the distance ratios calculated in the previous step and calculates their differences in the beginning and at the end, and then averages them at the group level. The resulted file is `DR_difference_results.xlsx,` which is stored in the folder **DR_difference_results** in the "results".

Based on this result, the Excel file `Mean_group_DR_changes.xlsx` is created considering only the average DR difference for each group, and which can be found from the "data" folder. In this data file, corresponding total cumulative shareholder return is used as the performance measure after the simulation process (more information can be found the paper). Using the information in `Mean_group_DR_changes.xlsx,` the MATLAB file `DR_differences.m` plots the variations of distance ratio differences between start and end maps at the group-level, and which is shown in Figure 4 in the paper. 

`DR_variation_beg_end.m` also plots the variation of the distance ratios from individual maps to corresponding group map in the beginning and the end. In this case, the DRs calculated in the first step are used (which can be found from the folder **DR_individuals_group** in the "data"). This plot is demontrated as Figure 5 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232).

## Cognitive structures' changes-based assessment
We start this analysis by collecting the frequency of each causal relationship (CR) for each strength value going through all adjacency matrices of the cognitive maps. A strength value for a particular causal relationship was allowed to vary from -3 to 3. This analysis can be found in the folder **CR_changes** and the generated results are saved in the folder **CR_variations** in "result." 

Essentially, this analysis focuses on the examination of 
1. what are the causal relationships that exist in the beginning maps but do not exist in the end maps? 
2. what are the causal relationships that do not exist in the beginning maps but do exist in the end maps?  
3. what are the causal relationships whose polarity has changed from the beginning to the end of the course?  
4. what are the most roubust causal relationships that the students expressed at the beginning of the course and that ended up being the same (or close to the same) by the end of the course?

Accordingly, we run this analysis in the matalb file `map_changes_analysis.m` using both `cr_changes.m` and `cr_frequency.m` functions.

- `map_changes_analysis.m`: This file analyses changes in cognitive maps in terms of the existence/non-existence, positive-negative/negative-positive, and most consistence causal relationships from the beginning to the end maps.

- `cr_changes.m`: This function creates the results Excel files consisteing frequencies of causal relationships for each strenght value in the beginning and at the end. 

- `cr_frequency.m`: This function finds frequencies of each causal relationship with respect to each strength value [-3, -2, -1, 0, 1, 2, 3].

We first find the changes of causal relationships from the beginning to the end maps considering the whole dataset in the file `map_changes_analysis.m` specifying the option `k=1` in the function `cr_changes.m` and the resulting file is `CR_frequencies_beg_end.xlsx.` Next, to investigate questions (1) & (2), the file `map_changes_analysis.m` is executed specifying the option `k=2` in the function `cr_changes.m` and the resulting file is `CR_frequencies_10_01.xlsx.` All resulting files are saved in the folder **CR_variations** in "results." 

For (3) & (4), we analyze the result file `CR_frequencies_beg_end.xlsx` and select the relevant `cases` and which are stored in the files: `Selected_CR_-_+.xlsx` and `Selected_CR_robust.xlsx,`which can be found in "data." These files are used in the file `main_barplots.m` to create Figures 10 & 11 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232). By using the data in `CR_frequencies_10_01.xlsx.` we also select relevant cases for (1) & (2), and created files: `Selected_CR_0_1.xlsx` and `Selected_CR_1_0.xlsx` can be found in "data," which are used in `main_barplots.m` to generate Figures 6 & 8 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232).

In addition, we also find the changes of CRs from the beginning to the end in each individual map, which can found as the last part of the `map_changes_analysis.m` and the resulting cases are stored in `crfreq_mapi` for each map i. With the help of this result, `Barplots_individuals.m` creates Figures 7 & 9 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232).

## FsQCA analysis
we also examine how the direction of each causal relationship has changed from the  beginning to end in the individual maps using a fsQCA approach. In this analysis, we use linguistic labels: negative, zero, and positive because the effect of one relationship on 	another could be negative, positive, or non-existent (zero) in the used cognitive maps data. Detailed description of this analysis and established hypotheses can be found in the paper. The membership calculation and the analysis have been placed in the folder **FsQCA analysis.** The MATLAB files used:

- `main_fsQCA_analysis.m`: This file loads the data and calculates the trapezoidal membership values for each linguistic variable (negative, positive, or non-existent (zero)) regarding each hypothesis defined. There are analyses composed in the file. 
    1. This analysis evaluates the hypotheses presented in the paper (see Table 2) regarding the changes in individual maps. The resulting file is saved as `fsQCAresults_changes.xlsx` in the folder **FsQCA results** in "results."
    2. This analysis is to investigate the polarity changes in specific causal relationships. The resulting file is saved as `fsQCAresults_selectedCR.xlsx` in the folder **FsQCA results** in "results."

- `concov.m`: This function calculates the fsQCA measures, consistency and coverage values defined by Ragin (2001). 

These results can be found in Tables 8 & 9 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232).

## Frequency analysis of strategic topics used in the maps
This analysis finds and plot the changes of frequencies of the strategic topics that appeared in the individual starting and end cognitive maps in the original data. Additionally, frequency differences between the end and starting maps are also demonstrated. Related MATLAB codes are:

- `frequency_strategic_topics.m`: This finds and plots the frequencies of usage of all the strategic issues in the maps provided at the beginning of the course (sub-figure 1), the frequencies for the end maps (sub-figure 2), and summarizes the difference
in the total frequency of use of the strategic concepts (sub-figure 3). 

- `frequency_topics_individuals.m`: This finds and plots a more individual-level view of the changes, where all emergences (positive frequencies) and removals (negative frequencies) of the strategic issues are being tracked. 

These plots can be found in Figure 1 in the paper [(Kumbure et al., 2023)](https://doi.org/10.1016/j.eswa.2023.121232).

## How to runthe code and produce results
The first run of the codes should be the calculation of distance ratios from the individual-level maps to the group-level maps considering the whole data sample. Running this code may take several minutes. These distance ratio results have already been saved in "data" because they are used in the subsequent analyses. This is because of showing the calculation of other analyses. In this study, analyses are connected - one code's output is used as an input for another code. Therefore needed result files are stored in "data" and loaded in the corresponding codes. 
