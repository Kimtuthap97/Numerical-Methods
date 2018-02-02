function [lagrangefun] = Lagrange(xi,yi)
syms x;
n=size(xi,2);
lagrangefun=0;
l=sym(ones(1,n));
for i=1:n
    for j=1:n
        if i~=j
            l(1,i)=l(1,i)*((x-xi(1,j))/(xi(1,i)-xi(1,j)));
        end
    end
    lagrangefun=simplify(lagrangefun+l(1,i)*yi(1,i));
end
end

