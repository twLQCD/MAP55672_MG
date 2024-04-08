%two level vcycle driver

%set grid size
p = 5; q = p;

%get fine level matrix
A = laplacian_2D(p,q);

%get R and P
[R,P] = restrict_2D(p,q,p-1,q-1);

%compute Ac
Ac = 

%set the weighting parameter for weighted jacobi
w  = 2/3;

%set the desired residual norm
rtol = 1e-8;

%set the desired number of smoothing iterations
m = 3;

%set the maximum number of v-cycles
num_cycles = 30;

%set right hand side vector
b = randn(size(A,1),1);

%set initial guess
x0 = zeros(size(A,1),1);

%compute the solution using multigrid
tic();
[x,r] = multigrid(A,R,P,Ac,b,x0,w,m,rtol,num_cycles);
time_to_solve = toc();
