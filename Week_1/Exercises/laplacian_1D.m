function A = laplacian_1D(p)

%creates the discrete 1D laplacian with pure Dirichlet boundary conditions
%input: integer p that creates a grid of size N = 2^p + 1

N = 2^p - 1;
A = sparse(diag(2*ones(1,N)) + diag(-1*ones(1,N-1),1) + diag(-1*ones(1,N-1),-1));
