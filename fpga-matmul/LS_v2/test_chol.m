
%---- set up input
%A = rand(4,4) + j*rand(4,4);
a = (1:40)/10;
b = (-1:-1:-40)/10;

%A = reshape(a(1:20),5,4) + j*reshape(a(21:40),5,4);
rng(1);
A = rand(5,4) + j*rand(5,4);
Y = [1; 2; 3; 4; 5];
%Y = reshape(b(1:20),4,5) + j*reshape(b(21:40),4,5);

C = A' * A;

fprintf('A = \n '); A
fprintf('C = \n '); C
%fprintf('Y = \n '); Y

%break;

%---- using matlab method
% A * X = Y
X = A\Y;
Yr = A*X

%fprintf('X (ideal) = \n '); X
%fprintf('Yr (ideal) = \n '); Yr


%---- using cholesky
[L,pd] = chol(C,'lower');

% compute z by backward substitution, L*Z = p
P = A' * Y;
Z = L \ P;

fprintf('P = \n '); P
fprintf('L = \n '); L
fprintf('Z = \n '); Z

% compute x by backward substitution, L'*Xls = Z
Xls  = L' \ Z;

fprintf('X (ideal) = \n '); X
%fprintf('Y = \n '); y
fprintf('X (chol) = \n '); Xls


if (0)
for (col=0:4)
    for (row=0:4)
    fprintf( 'A[%d][%d] = TC_std(', row,col, A(row+1,col+1));
    fprintf( ')\n');
    end
end
end


%---- taking inverse using cholesky
% C = L*L'
% C^-1 = (L*L')^-1
% = (L')^-1 * L^-1
% means one back subst to compute L^-1, and then matrix mult to compute:
% C^-1

Lt_inv = inv(L');
L_inv  = inv(L);
Cr     = Lt_inv * L_inv;

fprintf('inv(C) = \n '); inv(C)
fprintf('inv(L'') = \n '); Lt_inv
fprintf('inv(L) = \n '); L_inv
fprintf('inv(L*L'') = \n '); Cr




break;





Y = A(:,1);
P = A' * Y;
fprintf('Y = \n '); A
fprintf('P = \n '); P

% C     = spd_matrix(4)

% test cholesky decomposition
A = rand(4,4) + j*rand(4,4);
C = A'*A;

[R,p] = chol(C);

Cr = R'*R;
E  = C - Cr;

if 0
fprintf('P = %d \n', p);
fprintf('C = \n '); C
fprintf('Cr = \n '); Cr
fprintf('residual error = \n '); E
end

% test inv(C) = inv(R'*R) = inv(R) * inv(R') = inv(R) * (inv(R))'
if 0
Cinv = inv(C);
Rinv = inv(R);

fprintf('inv(C) = \n '); Cinv
fprintf('inv(R''*R) = \n '); Rinv * Rinv'
end

% apply LS
x = rand(4,1);
y = A*x;
%xls = A\y;

if 0
fprintf('X = \n '); x
fprintf('Y = \n '); y
fprintf('X recoverd = \n '); xls
end

% compute z by backward substitution, R'*z = p
p = A' * y;
z = R' \ p;

% compute x by backward substitution, R*x = z
xls  = R \ z;

if (1)
fprintf('X = \n '); x
%fprintf('Y = \n '); y
fprintf('X recoverd = \n '); xls
end





