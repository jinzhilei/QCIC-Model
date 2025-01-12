function [Ave_low,Ave_high]=proana_OS_CTLTreg()

n=1;
t=366;

[Q_low,Q_high]=Sur_Analysis_CTLTreg(t,n);

Ave_low=sum(Q_low,2)./n;
Ave_high=sum(Q_high,2)./n;

end