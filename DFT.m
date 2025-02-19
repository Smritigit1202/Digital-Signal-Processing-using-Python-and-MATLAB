xn=input('Enter x(n): ');

N = input('Enter N: ');

Xk=calcdft(xn,N);

disp('DFT is: ');

disp(Xk);

magnitude = abs(Xk);

phase = angle(Xk);

k=0:N-1;

subplot (2,1,1);

stem(k,magnitude);

title ('DFT sequence:(Smriti Aggarwal/22102178) ');

xlabel('Frequency');

ylabel('Magnitude');

subplot(2,1,2);

stem(k,phase);

title('Phase :(Smriti Aggarwal/22102178)');

xlabel('Frequency');

ylabel('Phase');

 function[Xk] = calcdft(xn,N)

   L=length(xn);

   if(N<L)

       error('N should be greater than L')

   end

   x1=[xn, zeros(1,N-L)];

   for k=0:1:N-1

       for n=0:1:N-1

           p=exp(-i*2*pi*n*k/N);

           W(k+1,n+1)=p;

       end

   end

   disp('Transformation matrix is:')

   disp(W);

   Xk=W.*(x1)

end

