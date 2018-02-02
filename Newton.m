function [ Newtonfun ] = Newton( xi,yi )
syms x;
n=size(xi,2);
tyhieu=[yi' ones(n,n-1)];
Newtonfun=yi(1,1);
p=1;
for i=2:n
    for j=i:n
        tyhieu((j:n),i)=(tyhieu(j:n,i-1)-tyhieu(i-1,i-1))/(xi(1,j)-xi(1,i-1));
    end
    p=p*(x-xi(1,i-1))
    Newtonfun=simplify(Newtonfun+tyhieu(i,i)*p)
end
end

