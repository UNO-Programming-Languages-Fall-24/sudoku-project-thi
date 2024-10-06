% Sudoku Solver 4x4
% Question 1c

% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n) 

#const n = 2.

subgrid(X, Y, G) :- X=1..n**2, Y=1..n**2, G=1+(((X-1)/n)*n+(Y-1)/n).
% achieved: subgrid allocation

{ sudoku(X, Y, N) : N = 1..n**2 } = 1 :- subgrid(X, Y, G).
% achieved: for every cell, assign a number from 1 to 4

N1 = N2 :- sudoku(X1, Y1, N1), initial(X2, Y2, N2), X1=X2, Y1=Y2.
% achieved: if the value in cell(X,Y) is provided in 'initial', take that value

:- sudoku(X1, Y1, N1), sudoku(X2, Y2, N2), X1=X2, N1=N2, Y1!=Y2.
% achieved: eliminate the solutions that have two cells on the same row with the same value 

:- sudoku(X1, Y1, N1), sudoku(X2, Y2, N2), X1!=X2, N1=N2, Y1=Y2.
% achieved: eliminate the solutions that have two cells on the same columns with the same value 

:- sudoku(X1, Y1, N1), sudoku(X2, Y2, N2), subgrid(X1, Y1, G1), subgrid(X2, Y2, G2), G1=G2, N1=N2, X1!=X2, Y1!=Y2.
% achieved: value does not show up twice in the same subgrid

#show sudoku/3.