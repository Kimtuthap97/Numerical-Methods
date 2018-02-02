function [ nghiem ] = Lapdon(A,b,e)
	%Kiem tra cheo troi, tim chuan
	if (abs(diag(A))-sum(abs(A),2))>0
		%La ma tran cheo troi hang
		index='inf';
		B=zeros(size(A,1));
		for i=1:size(A,1)
			B=(i,:)=-A(i,:)/A(i,i);
		end
		B=B+eye(size(A,1));
		g=b./diag(A);
		Z=eye(size(A,1));
	elseif (abs(diag(A)')*2-sum(abs(A),1))>0
		%La ma tran cheo cot
		%%% VAN CHUA HIEU LAM
		index=1;
		Z=diag(1./diag(A));
		B=eye(size(A,1))-A*Z;
		g=b;
	else
		fprintf('Khong thoa man dieu kien CHEO TROI')
		return
	end
	%Tinh toan
	%Khoi tao
	x0=zeros(size(A,1),1);
	x1=B*x0+g;
	%norm: tra ve chuan cua vector X
	while (norm(x1 - x0, index) > (1 - norm(B, index))*e / (norm(B, index)*norm(Z, index)))
		x0=x1;
		x1=B*x0+g;
	end

	%In ket qua
	if (index==1)
		nghiem=Z*x1;
	else nghiem=x1;
	end
end

function [X, k] = seidel(A, b, epsi, kmax)
    %Giai gan dung A*X = b, sai so epsi, so lan lap lon nhat kmax
    k = 0;
    n = size(A, 1);
    if(abs(diag(A))*2 - sum(abs(A), 2) > 0)
        index = 'inf';
        B = zeros(n);
        for i = 1 : n
            B(i, :) = -A(i, :) / A(i,i); 
        end
        B = B + eye(n);
        g = b ./ diag(A);
        lambda = max(sum(triu(abs(B),1)) ./ (1 - sum(tril(abs(B), 0))));
        coef = (1-lambda)/lambda;
    elseif(abs(diag(A)')*2 - sum(abs(A), 1) > 0)
        index = 1;
        Z = diag(1./diag(A));
        B = eye(n) - A*Z;
        g = b;
        si = max(sum(triu(abs(B), 0), 2) ./ (1- sum(tril(abs(B), -1),2)));
        S = max(abs(sum(tril(abs(B), -1)),2));
        coef = (1-S)*(1-si)/si;
    else
        printf('ko la cheo troi');
    end;
    x0 = zeros(n, 1);
    x1 = x0;
    for i = 1 : n
        x1(i) = B(i, :) * x1 + g(i);
    end;
    while (norm(x1-x0, index) > coef*epsi && k < kmax)
        x0 = x1;
        for i = 1 : n
            x1(i) = B(i, :) * x1 + g(i);
        end;
        k = k+1;
    end;
    if(index == 1)
        X = Z * x1;
    else
        X = x1;
    end
end