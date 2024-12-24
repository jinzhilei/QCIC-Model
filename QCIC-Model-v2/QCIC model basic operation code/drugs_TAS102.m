function Chem=drugs_TAS102(k_in_Chem,t)

%% generate k value

k1=[1:1:5];k2=[8:1:12];
K1=[k1 k2];
K2=28+K1;
K3=28+K2;
k=[K1 K2 K3];    

%% generate Chem

n=length(k);
for i=1:n
    if k(i) <= t && (k(i)+1/10) > t
        Chem=10*k_in_Chem;
         break;
    else
        Chem=0;
    end
end

end
