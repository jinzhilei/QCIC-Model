function Data_preprocessing_Placebo_T1()

sample = 4000; 
Non_PP = zeros(sample,1);
PP = zeros(sample,1);

global par
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
par.T = 4e8;

for i=1:sample

    file=['./Placebo_VP/','VP',num2str(i),'.mat'];
    A=cell2mat(struct2cell(load(file)));
    [T1_C,~,~,X1_C,X2_C,X3_C]=cell_data(A);

    T = X1_C(1:56:end)+X2_C(1:56:end)+X3_C(1:56:end);
    V_before = ( par.V_tumor * par.T * par.V_C ) / par.V_E;
    V_after  = ( par.V_tumor .* T .* par.V_C ) / par.V_E;
    V = V_after / V_before - 1;


    if V(2)>=0.2
        PP(i) = T1_C(57,1);
    else
        Non_PP(i) = T1_C(57,1);
    end

end

Non_PP(Non_PP==0)=[];
PP(PP==0)=[];

file='./Data_ClinProAnalysis/Th1_NP_Placebo.mat';
save(file,'Non_PP');
file='./Data_ClinProAnalysis/Th1_P_Placebo.mat';
save(file,'PP');

end