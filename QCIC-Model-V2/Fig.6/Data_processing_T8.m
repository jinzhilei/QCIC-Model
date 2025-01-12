function Data_processing_T8()

B=zeros(500,6);

file1='./Data_ClinProAnalysis/T8_NP_Placebo.mat';
T8_NP_Placebo=cell2mat(struct2cell(load(file1)));

file2='./Data_ClinProAnalysis/T8_P_Placebo.mat';
T8_P_Placebo=cell2mat(struct2cell(load(file2)));

file3='./Data_ClinProAnalysis/T8_NP_TAS102.mat';
T8_NP_TAS102=cell2mat(struct2cell(load(file3)));

file4='./Data_ClinProAnalysis/T8_P_TAS102.mat';
T8_P_TAS102=cell2mat(struct2cell(load(file4)));

file5='./Data_ClinProAnalysis/T8_NP_TASBEV.mat';
T8_NP_TASBEV=cell2mat(struct2cell(load(file5)));

file6='./Data_ClinProAnalysis/T8_P_TASBEV.mat';
T8_P_TASBEV=cell2mat(struct2cell(load(file6)));

% nan
T8_NP_Placebo=T8_NP_Placebo(~isnan(T8_NP_Placebo));
T8_P_Placebo=T8_P_Placebo(~isnan(T8_P_Placebo));
T8_NP_TAS102=T8_NP_TAS102(~isnan(T8_NP_TAS102));
T8_P_TAS102=T8_P_TAS102(~isnan(T8_P_TAS102));
T8_NP_TASBEV=T8_NP_TASBEV(~isnan(T8_NP_TASBEV));
T8_P_TASBEV=T8_P_TASBEV(~isnan(T8_P_TASBEV));

% 500
B(:,1)=T8_NP_Placebo(1:1:500);

B(:,2)=T8_P_Placebo(1:1:500);

B(:,3)=T8_NP_TAS102(1:1:500);

B(:,4)=T8_P_TAS102(1:1:500);

B(:,5)=T8_NP_TASBEV(1:1:500);

B(:,6)=T8_P_TASBEV(1:1:500);

file='./Data_Boxplot/T8.mat';

save(file,'B');

end