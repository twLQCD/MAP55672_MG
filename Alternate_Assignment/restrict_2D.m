function [R,P] = restrict_2D(p,q,pc,qc)

%function to return to the 2D restriction matrix
%using full weighting

%input
%p: integer to determine the fine grid extent in x
%q: integer to determine the fine grid extent in y
%pc: integer to determine the coarse grid extent in x
%qc: integer to determine the coarse grid extent in y

assert(p == pc + 1)
assert(q == qc + 1)

nx = 2^p-1;
ny = 2^q-1;

ncx = 2^pc-1;
ncy = 2^qc-1;

R = sparse(ncx*ncy,nx*ny);

for i = 1:ncx
    for j = 1:ncy
        
        %get the coordinates of the fine grid points
        i_f = 2*i;
        j_f = 2*j;
        
        %get the index of the fine grid points
        k_f = i_f + (j_f-1)*nx;
        
        %get the index of the coarse grid points
        k_c = i + (j-1)*ncx;
        
        %get the index of the nearest neighbors
        ifp1 = i_f+1 + (j_f-1)*nx;
        ifm1 = i_f-1 + (j_f-1)*nx;
        jfp1 = i_f + j_f*nx;
        jfm1 = i_f + (j_f-2)*nx;
        
        %get the index of the next nearest neighbors
        ifm1_jfp1 = i_f-1 + j_f*nx;
        ifm1_jfm1 = i_f-1 + (j_f-2)*nx;
        ifp1_jfp1 = i_f+1 + j_f*nx;
        ifp1_jfm1 = i_f+1 + (j_f-2)*nx;
        
        
        R(k_c,k_f) = 1/4;
        R(k_c,ifp1) = 1/8;
        R(k_c,ifm1) = 1/8;
        R(k_c,jfp1) = 1/8;
        R(k_c,jfm1) = 1/8;
        R(k_c,ifm1_jfp1) = 1/16;
        R(k_c,ifm1_jfm1) = 1/16;
        R(k_c,ifp1_jfp1) = 1/16;
        R(k_c,ifp1_jfm1) = 1/16;
        
        
    end
end

P = 4*R';
