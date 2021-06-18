# `fixed_point_iteration` [![View Fixed Point Iteration (fixed_point_iteration) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/86992-fixed-point-iteration-fixed_point_iteration)

Calculates the fixed point of a univariate function using fixed-point iteration.


## Syntax

`c = fixed_point_iteration(f,x0)`\
`c = fixed_point_iteration(f,x0,TOL)`\
`c = fixed_point_iteration(f,x0,[],imax)`\
`c = fixed_point_iteration(f,x0,TOL,imax)`\
`c = fixed_point_iteration(__,'all')`


## Description

`c = fixed_point_iteration(f,x0)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`c = fixed_point_iteration(f,x0,TOL)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`c = fixed_point_iteration(f,x0,[],imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`c = fixed_point_iteration(f,x0,TOL,imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`c = fixed_point_iteration(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the fixed point, and the last element is the converged fixed point. This identifier 'all' may be appended to any of the syntaxes used above.


## Examples and Additional Documentation

   -  See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   -  See "DOCUMENTATION.pdf" (included with download, also available at https://github.com/tamaskis/fixed_point_iteration-MATLAB/blob/main/DOCUMENTATION.pdf) for additional documentation.
