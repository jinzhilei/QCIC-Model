function [Ave_low,Ave_high]=proana_OS_T1Treg()

n=1;
t=366;

[Q_low,Q_high]=Sur_Analysis_T1Treg(t,n);

Ave_low=sum(Q_low,2)./n;
Ave_high=sum(Q_high,2)./n;

end