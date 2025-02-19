Xk = input('Enter X(k): '); 
xn=calcidft(Xk); 
N=length(xn); 
disp('xn is'); 
disp(xn); 
n=0:N-1; 
stem(n,xn); 
xlabel('time'); 
ylabel('Amplitude'); 
title("Smriti Aggarwal /22102178")
  
function [xn] = calcidft(Xk)
    N=length(Xk); 
    for k=0:1:N-1 
        for n=0:1:N-1 
            p=exp(i*2*pi*n*k/N); 
            IT(k+1,n+1)=p; 
        end
    end
    disp(' Matrix for IDFT'); 
    disp(IT); 
    xn = (IT*(Xk.'))/N; 
end