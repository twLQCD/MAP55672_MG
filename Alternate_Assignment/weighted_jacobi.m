function [x,iters,r] = weighted_jacobi(A,b,xk,w,max_iters,tol)

iters  = 0;
rn = norm(b-A*xk);
%x_true = A\b;
%err = norm(x_true-xk);
Dinv = w*(1./diag(A));
r = rn;
while ( rn > tol && iters <= max_iters)  
    x = xk - Dinv.*(A*xk) + Dinv.*b;
    xk = x;
    iters = iters + 1;
    rn = norm(b-A*xk);
    r = [r; rn];
    %err = [err; norm(x_true-xk)];
end