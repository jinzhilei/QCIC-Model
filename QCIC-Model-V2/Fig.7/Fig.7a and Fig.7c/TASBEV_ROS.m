function TASBEV_ROS()

sample = 500;

global par
par.V_tumor = 2.572e-9;
par.V_C = 0.8;
par.V_E = 0.37;
par.T = 4e8;

T1_C_sample=zeros(sample,1);
T8_C_sample=zeros(sample,1);
T8Treg_sample=zeros(sample,1);
T1Treg_sample=zeros(sample,1);
T_C_sample=zeros(sample,1);

for i=1:sample

    file=['./TASBEV_VP/','VP',num2str(i),'.mat'];
    X=cell2mat(struct2cell(load(file)));
    A=X(57,:);
    [T1_C,Treg_C,T8_C,X1_C,X2_C,X3_C]=cell_data(A);

    X_C = X1_C + X2_C + X3_C;
    V_before = ( par.V_tumor * par.T * par.V_C ) / par.V_E;
    V_after  = ( par.V_tumor * X_C * par.V_C ) / par.V_E;
    V = V_after / V_before - 1;

    T8Treg=T8_C./Treg_C;
    T1Treg=T1_C./Treg_C;

    T1_C_sample(i)=T1_C;
    T8_C_sample(i)=T8_C;
    T8Treg_sample(i)=T8Treg;
    T1Treg_sample(i)=T1Treg;

    if V>=0.2
        T_C_sample(i)=0;
    else
        T_C_sample(i)=1;
    end

end


file='./TASBEV_ROC/T_C_sample.mat';
save(file,'T_C_sample');

file='./TASBEV_ROC/T1_C_sample.mat';
save(file,'T1_C_sample');

file='./TASBEV_ROC/T8_C_sample.mat';
save(file,'T8_C_sample');

file='./TASBEV_ROC/T8Treg_sample.mat';
save(file,'T8Treg_sample');

file='./TASBEV_ROC/T1Treg_sample.mat';
save(file,'T1Treg_sample');
