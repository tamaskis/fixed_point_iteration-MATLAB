# `fixed_point_iteration` [![View Fixed Point Iteration (fixed_point_iteration) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/86992-fixed-point-iteration-fixed_point_iteration)

Calculates the fixed point of a univariate, scalar-valued function using fixed-point iteration.


## Syntax

`c = fixed_point_iteration(f,x0)`\
`c = fixed_point_iteration(f,x0,opts)`


## Description

`c = fixed_point_iteration(f,x0)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`c = fixed_point_iteration(f,x0,opts)` does the same as the syntax above, but allows for the specification of optional solver parameters. `opts` is a structure that has the following fields:
   - `imax` &rightarrow; maximum number of iterations
   - `return_all` &rightarrow; all intermediate fixed point estimates are returned if set to `true`; otherwise, only the converged fixed point is returned
   - `TOL` &rightarrow; tolerance
   - `warnings` &rightarrow; `true` if any warnings should be displayed, `false` if not


## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See ["Fixed_Point_Iteration.pdf"](https://tamaskis.github.io/documentation/Fixed_Point_Iteration.pdf) (also included with download) for the technical documentation.
