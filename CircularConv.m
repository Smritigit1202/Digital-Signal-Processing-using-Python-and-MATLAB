Xn = input('Enter X(n): '); 
 hn = input('Enter H(n): '); 
N=4; 
n1= length(Xn);
n2= length(hn);
if(n1<4)
   Xn=[Xn,zeros(1,4)];
end
if(n2<4)
    hn=[hn,zeros(1,4)];
end
w=mycirconv(Xn , hn); 
disp('ans is'); 
disp(w); 
n=1:4; 
stem(n,w); 
xlabel('time'); 
ylabel('Amplitude'); 
title("Smriti Aggarwal /22102178")
  
function [w] = mycirconv(Xn, hn)
syms p
    N=4;
    p=0;
    for n=1:1:N
        for k=1:1:N 
            p=p+ (Xn(k)*hn(k)); 
            
        end
      IT(n)=p
       p=0; 
    o= Xn(1);
    Xn(1)=Xn(2);
    Xn(2)=Xn(3);
    Xn(3)=Xn(4);
    Xn(4)=o;
      
    end
     
    w = IT; 
end