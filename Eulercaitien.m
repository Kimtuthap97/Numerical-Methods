function [ Y ] = Eulercaitien(fun,y0,a,b,n)
Y=zeros(1,n);
h=(b-a)/n;
X=a:h:b;
Y(1)=y0;
for i=2:n
    k1=h*feval(fun,X(i-1),Y(i-1));
    k2=h*feval(fun,X(i),Y(i-1)+k1);
    Y(i)=Y(i-1)+(1/2)*(k1+k2);
end
end

