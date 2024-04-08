function x = two_level_vcycle(A,R,P,Ac,b,x0,w,m)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Input:

%A: fine level matrix
%R: restriction matrix
%P: prolongation matrix
%Ac: coarse level matrix
%b: right hand side vector
%x0: initial guess vector
%w: smoothing parameter for weighted jacobi
%m: the number of smoothing iterations

%Output:

%x: the solution after 1 two level vcycle iteration

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%1. Smooth on A * x = b with initial guess x0 using m iterations of weighted Jacobi with weighting
%parameter w to get x



%2. Compute the residual r = b ? Ax



%3. Restrict the residual to the coarse grid so that rc = R * r



%4. Directly solve Ac * xc = rc (use Matlab's backslash operator)


%5. Prolong and add to the current solution: x = x + P * xc


%6. Smooth on A * x = b with initial guess x using m iterations of weighted Jacobi with weighting
%parameter w to get x