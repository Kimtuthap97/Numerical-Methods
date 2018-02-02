function [Y] = Euler(fun,y0,a,b,n)
%fun: ham f: y'=f(x,y); Nhap dang function handle: VD: @(x,y) x^2-y
%y0: gia tri f(a)=y0
%n: so moc mong muon
h=(b-a)/n;
X=a:h:b;
Y=zeros(1,n);
Y(1)=y0;
for i=2:n
    Y(i)=Y(i-1)+h*feval(fun,X(i-1),Y(i-1));
end
end

