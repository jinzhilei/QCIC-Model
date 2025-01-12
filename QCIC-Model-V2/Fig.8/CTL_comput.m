function [Death_low,Death_high]=CTL_comput(mu,sigma)

%% Tumor proportion
sample=50;
t=366;

X_low=zeros(366,sample);
X_high=zeros(366,sample);

%% load
file_1='./ProAnalysis/Th8_low.mat';
A1=cell2mat(struct2cell(load(file_1)));

file_2='./ProAnalysis/Th8_high.mat';
A2=cell2mat(struct2cell(load(file_2)));

file_K1='./ProAnalysis/Th8_K3_low.mat';
B1=cell2mat(struct2cell(load(file_K1)));

file_K2='./ProAnalysis/Th8_K3_high.mat';
B2=cell2mat(struct2cell(load(file_K2)));

for i=1:sample
X_low(:,i)=A1(:,i)./B1(i);
X_high(:,i)=A2(:,i)./B2(i);
end

%% comput

O=ones(t,sample+1);
O(:,1)=1:1:t;

Death_low_time=zeros(1,sample+1);
Death_high_time=zeros(1,sample+1);

for i=2:sample+1
    for j=1:t
        P_death_low=1/(1+exp(-(X_low(j,i-1)-mu)/sigma));
        P=[1-P_death_low P_death_low];
        Q=[1 0];
        O(j,i)=randsrc(1,1,[Q;P]);
        if O(j,i) == 0
            Death_low_time(i)=O(j,1);
            break;
        else
            continue;
        end
    end
end

for i=2:sample+1
    for j=1:t
        P_death_high=1/(1+exp(-(X_high(j,i-1)-mu)/sigma));
        P=[1-P_death_high P_death_high];
        Q=[1 0];
        O(j,i)=randsrc(1,1,[Q;P]);
        if O(j,i) == 0
            Death_high_time(i)=O(j,1);
            break;
        else
            continue;
        end
    end
end

Death_low=sort(Death_low_time(2:1:end));
Death_high=sort(Death_high_time(2:1:end));

end

