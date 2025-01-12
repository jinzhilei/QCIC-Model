function Prognostic_analysis()

sample = 100;

global par
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
par.T = 4e8;

T1_C_sample=zeros(sample,1);
T8_C_sample=zeros(sample,1);
T8Treg_sample=zeros(sample,1);
T1Treg_sample=zeros(sample,1);
Tumor_sample=zeros(sample,1);

for i=1:sample

    file=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    A=cell2mat(struct2cell(load(file)));
    [T1_C,Treg_C,T8_C,X1_C,X2_C,X3_C]=pro_data(A);

    X_C = X1_C + X2_C + X3_C;
    V_before = ( par.V_tumor .* par.T .* par.V_C ) ./ par.V_E;
    V_after  = ( par.V_tumor .* X_C .* par.V_C ) ./ par.V_E;
    V = V_after ./ V_before - 1;
    Tumor = V(57);

    T8Treg=T8_C./Treg_C;
    T1Treg=T1_C./Treg_C;

    T1_C_sample(i)=T1_C;
    T8_C_sample(i)=T8_C;
    T8Treg_sample(i)=T8Treg;
    T1Treg_sample(i)=T1Treg;
    Tumor_sample(i)=Tumor;

end

T1_C_index=median(T1_C_sample);
T8_C_index=median(T8_C_sample);
T8Treg_index=median(T8Treg_sample);
T1Treg_index=median(T1Treg_sample);

Th1_high=zeros(366,sample);
Th1_low=zeros(366,sample);
Th8_high=zeros(366,sample);
Th8_low=zeros(366,sample);
T8Treg_high=zeros(366,sample);
T8Treg_low=zeros(366,sample);
T1Treg_high=zeros(366,sample);
T1Treg_low=zeros(366,sample);

Th1_K3_low=zeros(sample,1);
Th1_K3_high=zeros(sample,1);
Th8_K3_low=zeros(sample,1);
Th8_K3_high=zeros(sample,1);
T1Treg_K3_low=zeros(sample,1);
T1Treg_K3_high=zeros(sample,1);
T8Treg_K3_low=zeros(sample,1);
T8Treg_K3_high=zeros(sample,1);

for i=1:sample

    file_Matrix='./TASBEV_VP/VP_LHS_Matrix.mat';
    M_initial=cell2mat(struct2cell(load(file_Matrix)));
    M_K3=M_initial(:,11);
    file_index=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    A_index=cell2mat(struct2cell(load(file_index)));
    [~,~,~,X1_C,X2_C,X3_C]=pro_data(A_index);
    X_C = X1_C + X2_C + X3_C;

    if T1_C_sample(i)>=T1_C_index
        Th1_high(:,i)=X_C;
        Th1_K3_high(i)= M_K3(i);
    else
        Th1_low(:,i)=X_C;
        Th1_K3_low(i)= M_K3(i);
    end

end

for i=1:sample

    file_Matrix='./TASBEV_VP/VP_LHS_Matrix.mat';
    M_initial=cell2mat(struct2cell(load(file_Matrix)));
    M_K3=M_initial(:,11);
    file_index=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    A_index=cell2mat(struct2cell(load(file_index)));
    [~,~,~,X1_C,X2_C,X3_C]=pro_data(A_index);
    X_C = X1_C + X2_C + X3_C;

    if T8_C_sample(i)>=T8_C_index
        Th8_high(:,i)=X_C;
        Th8_K3_high(i)= M_K3(i);
    else
        Th8_low(:,i)=X_C;
        Th8_K3_low(i)= M_K3(i);
    end

end

for i=1:sample

    file_Matrix='./TASBEV_VP/VP_LHS_Matrix.mat';
    M_initial=cell2mat(struct2cell(load(file_Matrix)));
    M_K3=M_initial(:,11);
    file_index=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    A_index=cell2mat(struct2cell(load(file_index)));
    [~,~,~,X1_C,X2_C,X3_C]=pro_data(A_index);
    X_C = X1_C + X2_C + X3_C;

    if T1Treg_sample(i)>=T1Treg_index
        T1Treg_high(:,i)=X_C;
        T1Treg_K3_high(i)= M_K3(i);
    else
        T1Treg_low(:,i)=X_C;
        T1Treg_K3_low(i)= M_K3(i);
    end

end

for i=1:sample

    file_Matrix='./TASBEV_VP/VP_LHS_Matrix.mat';
    M_initial=cell2mat(struct2cell(load(file_Matrix)));
    M_K3=M_initial(:,11);
    file_index=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    A_index=cell2mat(struct2cell(load(file_index)));
    [~,~,~,X1_C,X2_C,X3_C]=pro_data(A_index);
    X_C = X1_C + X2_C + X3_C;

    if T8Treg_sample(i)>=T8Treg_index
        T8Treg_high(:,i)=X_C;
        T8Treg_K3_high(i)= M_K3(i);
    else
        T8Treg_low(:,i)=X_C;
        T8Treg_K3_low(i)= M_K3(i);
    end

end

%% marker

Th1_high(:, all(Th1_high==0)) = [];
Th1_low(:, all(Th1_low==0)) = [];

file_Th1_high=['./ProAnalysis/','Th1_high.mat'];
file_Th1_low=['./ProAnalysis/','Th1_low.mat'];

save(file_Th1_high,'Th1_high');
save(file_Th1_low,'Th1_low');

Th8_high(:, all(Th8_high==0)) = [];
Th8_low(:, all(Th8_low==0)) = [];

file_Th8_high=['./ProAnalysis/','Th8_high.mat'];
file_Th8_low=['./ProAnalysis/','Th8_low.mat'];

save(file_Th8_high,'Th8_high');
save(file_Th8_low,'Th8_low');

T1Treg_high(:, all(T1Treg_high==0)) = [];
T1Treg_low(:, all(T1Treg_low==0)) = [];

file_T1Treg_high=['./ProAnalysis/','T1Treg_high.mat'];
file_T1Treg_low=['./ProAnalysis/','T1Treg_low.mat'];

save(file_T1Treg_high,'T1Treg_high');
save(file_T1Treg_low,'T1Treg_low');

T8Treg_high(:, all(T8Treg_high==0)) = [];
T8Treg_low(:, all(T8Treg_low==0)) = [];

file_T8Treg_high=['./ProAnalysis/','T8Treg_high.mat'];
file_T8Treg_low=['./ProAnalysis/','T8Treg_low.mat'];

save(file_T8Treg_high,'T8Treg_high');
save(file_T8Treg_low,'T8Treg_low');

%% marker_k

Th1_K3_high(all(Th1_K3_high==0,2),:) = [];
Th1_K3_low(all(Th1_K3_low==0,2),:) = [];

file_T1_K3_high=['./ProAnalysis/','Th1_K3_high.mat'];
file_T1_K3_low=['./ProAnalysis/','Th1_K3_low.mat'];

save(file_T1_K3_high,'Th1_K3_high');
save(file_T1_K3_low,'Th1_K3_low');

Th8_K3_high(all(Th8_K3_high==0,2),:) = [];
Th8_K3_low(all(Th8_K3_low==0,2),:) = [];

file_T8_K3_high=['./ProAnalysis/','Th8_K3_high.mat'];
file_T8_K3_low=['./ProAnalysis/','Th8_K3_low.mat'];

save(file_T8_K3_high,'Th8_K3_high');
save(file_T8_K3_low,'Th8_K3_low');

T1Treg_K3_high(all(T1Treg_K3_high==0,2),:) = [];
T1Treg_K3_low(all(T1Treg_K3_low==0,2),:) = [];

file_T1Treg_K3_high=['./ProAnalysis/','T1Treg_K3_high.mat'];
file_T1Treg_K3_low=['./ProAnalysis/','T1Treg_K3_low.mat'];

save(file_T1Treg_K3_high,'T1Treg_K3_high');
save(file_T1Treg_K3_low,'T1Treg_K3_low');

T8Treg_K3_high(all(T8Treg_K3_high==0,2),:) = [];
T8Treg_K3_low(all(T8Treg_K3_low==0,2),:) = [];

file_T8Treg_K3_high=['./ProAnalysis/','T8Treg_K3_high.mat'];
file_T8Treg_K3_low=['./ProAnalysis/','T8Treg_K3_low.mat'];

save(file_T8Treg_K3_high,'T8Treg_K3_high');
save(file_T8Treg_K3_low,'T8Treg_K3_low');

end