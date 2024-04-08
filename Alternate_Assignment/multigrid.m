function [x,r] = multigrid(A,R,P,Ac,b,x0,w,m,rtol,num_cycles)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Input:

%A: fine level matrix
%R: restriction matrix
%P: prolongation matrix
%Ac: coarse matrix
%b: right hand side vector
%x0: initial guess vector
%w: weighting parameter for weighted jacobi
%m: the number of smoothing iterations
%rtol: the desired residual norm
%num_cycles: the maximum number of v-cycles

%Output:
%x: the solution to the system of linear equations A * x  = b
%r: a vector containing the residual norm at each v-cycle iteration


iters = 0;
rn = norm(b - A*x0);
r = [];
while( iters <= num_cycles && rn >= rtol)
    x = two_level_vcycle(A,R,P,Ac,b,x0,w,m);
    x0 = x;
    rn = norm(b - A*x0);
    iters = iters + 1;
    r = [r; rn];
end