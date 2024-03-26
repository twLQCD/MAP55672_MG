function [x,iters,r] = jacobi(A,b,xk,max_iters,tol)

iters  = 0;
rn = norm(b-A*xk);
Dinv = diag(1./diag(A));
r = [];
while ( rn > tol && iters <= max_iters)  
    x = xk - Dinv*(A*xk) + Dinv*b;
    xk = x;
    iters = iters + 1;
    rn = norm(b-A*xk);
    r = [r; rn];
end