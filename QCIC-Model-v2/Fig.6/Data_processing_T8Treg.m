function Data_processing_T8Treg()

D=zeros(500,6);

file1='./Data_ClinProAnalysis/T8Treg_NP_Placebo.mat';
T8Treg_NP_Placebo=cell2mat(struct2cell(load(file1)));

file2='./Data_ClinProAnalysis/T8Treg_P_Placebo.mat';
T8Treg_P_Placebo=cell2mat(struct2cell(load(file2)));

file3='./Data_ClinProAnalysis/T8Treg_NP_TAS102.mat';
T8Treg_NP_TAS102=cell2mat(struct2cell(load(file3)));

file4='./Data_ClinProAnalysis/T8Treg_P_TAS102.mat';
T8Treg_P_TAS102=cell2mat(struct2cell(load(file4)));

file5='./Data_ClinProAnalysis/T8Treg_NP_TASBEV.mat';
T8Treg_NP_TASBEV=cell2mat(struct2cell(load(file5)));

file6='./Data_ClinProAnalysis/T8Treg_P_TASBEV.mat';
T8Treg_P_TASBEV=cell2mat(struct2cell(load(file6)));

% nan
T8Treg_NP_Placebo=T8Treg_NP_Placebo(~isnan(T8Treg_NP_Placebo));
T8Treg_P_Placebo=T8Treg_P_Placebo(~isnan(T8Treg_P_Placebo));
T8Treg_NP_TAS102=T8Treg_NP_TAS102(~isnan(T8Treg_NP_TAS102));
T8Treg_P_TAS102=T8Treg_P_TAS102(~isnan(T8Treg_P_TAS102));
T8Treg_NP_TASBEV=T8Treg_NP_TASBEV(~isnan(T8Treg_NP_TASBEV));
T8Treg_P_TASBEV=T8Treg_P_TASBEV(~isnan(T8Treg_P_TASBEV));

% 500
D(:,1)=T8Treg_NP_Placebo(1:1:500);

D(:,2)=T8Treg_P_Placebo(1:1:500);

D(:,3)=T8Treg_NP_TAS102(1:1:500);

D(:,4)=T8Treg_P_TAS102(1:1:500);

D(:,5)=T8Treg_NP_TASBEV(1:1:500);

D(:,6)=T8Treg_P_TASBEV(1:1:500);

file='./Data_Boxplot/T8Treg.mat';

save(file,'D');

end