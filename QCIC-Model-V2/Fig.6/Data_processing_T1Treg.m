function Data_processing_T1Treg()

C=zeros(500,6);

file1='./Data_ClinProAnalysis/T1Treg_NP_Placebo.mat';
T1Treg_NP_Placebo=cell2mat(struct2cell(load(file1)));

file2='./Data_ClinProAnalysis/T1Treg_P_Placebo.mat';
T1Treg_P_Placebo=cell2mat(struct2cell(load(file2)));

file3='./Data_ClinProAnalysis/T1Treg_NP_TAS102.mat';
T1Treg_NP_TAS102=cell2mat(struct2cell(load(file3)));

file4='./Data_ClinProAnalysis/T1Treg_P_TAS102.mat';
T1Treg_P_TAS102=cell2mat(struct2cell(load(file4)));

file5='./Data_ClinProAnalysis/T1Treg_NP_TASBEV.mat';
T1Treg_NP_TASBEV=cell2mat(struct2cell(load(file5)));

file6='./Data_ClinProAnalysis/T1Treg_P_TASBEV.mat';
T1Treg_P_TASBEV=cell2mat(struct2cell(load(file6)));

% nan
T1Treg_NP_Placebo=T1Treg_NP_Placebo(~isnan(T1Treg_NP_Placebo));
T1Treg_P_Placebo=T1Treg_P_Placebo(~isnan(T1Treg_P_Placebo));
T1Treg_NP_TAS102=T1Treg_NP_TAS102(~isnan(T1Treg_NP_TAS102));
T1Treg_P_TAS102=T1Treg_P_TAS102(~isnan(T1Treg_P_TAS102));
T1Treg_NP_TASBEV=T1Treg_NP_TASBEV(~isnan(T1Treg_NP_TASBEV));
T1Treg_P_TASBEV=T1Treg_P_TASBEV(~isnan(T1Treg_P_TASBEV));

% 500

C(:,1)=T1Treg_NP_Placebo(1:1:500);

C(:,2)=T1Treg_P_Placebo(1:1:500);

C(:,3)=T1Treg_NP_TAS102(1:1:500);

C(:,4)=T1Treg_P_TAS102(1:1:500);

C(:,5)=T1Treg_NP_TASBEV(1:1:500);

C(:,6)=T1Treg_P_TASBEV(1:1:500);

file='./Data_Boxplot/T1Treg.mat';

save(file,'C');

end