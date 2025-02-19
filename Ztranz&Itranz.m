sym z;
x = input('Enter the sequence x(n): ');
n1 = 0;
n2 = n1+length(x)-1;
m = 1;
result = 0;
for i=n1:n2
result = result + x(m)*(z^(-i));
m = m + 1;
end
disp(result);





%syms z
%f = (z^2 + 2*z +1)/(z^2-z+0.3561);
%iztrans(f,z,n)



%syms n
%f = n+1;
%ztrans(f)