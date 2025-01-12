function Trag=drugs_bevacizumab(k_in_Trag,x)

k=1:15:72;
n=length(k);

for i=1:n
        if k(i) <= x && (k(i)+1/10) > x
            Trag=10*k_in_Trag;
            break;
        else
            Trag=0;
        end
end



end
