function [Q_low,Q_high]=Sur_Analysis_CTL(t,n)

mu_min=0.60;
mu_max=0.90;
sigma_min=0.050;
sigma_max=0.080;

OS_low=zeros(t,1);
OS_high=zeros(t,1);
Q_low=zeros(t,n);
Q_high=zeros(t,n);

for j=1:1:n

    mu=mu_min+rand(1)*(mu_max-mu_min);
    sigma=sigma_min+rand(1)*(sigma_max-sigma_min);
    [Death_low,Death_high]=CTL_comput(mu,sigma);

    OS_low(1)=100;

    for i=2:1:t
        OS_low(i)=OS_low(i-1)-length(find(Death_low==i))*2;
        if OS_low(i)<0
           OS_low(i)=0;
        end
    end

    OS_high(1)=100;

    for k=2:1:t
        OS_high(k)=OS_high(k-1)-length(find(Death_high==k))*0.4;
        if OS_high(k)<0
           OS_high(k)=0;
        end
    end

    Q_low(:,j)=OS_low;
    Q_high(:,j)=OS_high;

end
