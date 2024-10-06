% Sudoku Solver 4x4
% Question 1a

% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

#const n = 4.

cell(X, Y) :- X=1..n, Y= 1..n.
% achieved: all possible cells in the grid of size 4

{ sudoku(X, Y, N) : N = 1..n } = 1 :- cell(X,Y).
% achieved: for every cell, assign a number from 1 to 4

N1 = N2 :- sudoku(X1, Y1, N1), initial(X2, Y2, N2), X1=X2, Y1=Y2.
% achieved: if the value in cell(X,Y) is provided in 'initial', take that value

:- sudoku(X1, Y1, N1), sudoku(X2, Y2, N2), X1=X2, N1=N2, Y1!=Y2.
% achieved: eliminate the solutions that have two cells on the same row with the same value 

:- sudoku(X1, Y1, N1), sudoku(X2, Y2, N2), X1!=X2, N1=N2, Y1=Y2.
% achieved: eliminate the solutions that have two cells on the same columns with the same value 

#show sudoku/3.
