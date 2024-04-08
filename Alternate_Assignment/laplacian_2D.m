function A = laplacian_2D(p,q)

%creates the discrete 2D laplacian with pure Dirichlet boundary conditions

%input:
% p: integer that creates a grid in x of size Nx = 2^p + 1
% q: integer that creates a grid in y of size Ny = 2^q + 1

Nx = 2^p - 1;
Ny = 2^q - 1;

X = sparse(diag(2*ones(1,Nx)) + diag(-1*ones(1,Nx-1),1) + diag(-1*ones(1,Nx-1),-1));
Y = sparse(diag(2*ones(1,Ny)) + diag(-1*ones(1,Ny-1),1) + diag(-1*ones(1,Ny-1),-1));

A = sparse(kron(X,speye(Ny)) + kron(speye(Nx),Y));