function [T1_C,Treg_C,T8_C,X1_C,X2_C,X3_C]=pro_data(A)

X1_C = A(:,32);
X2_C = A(:,33);
X3_C = A(:,34);
T1_C = A(57,35);
Treg_C = A(57,38);
T8_C = A(57,40);

end