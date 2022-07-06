# `fixed_point_iteration` [![View Fixed Point Iteration (fixed_point_iteration) on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/86992-fixed-point-iteration-fixed_point_iteration)

Fixed-point iteration for finding the fixed point of a univariate, scalar-valued function.


## Syntax

`c = fixed_point_iteration(f,x0)`\
`c = fixed_point_iteration(f,x0,opts)`\
`[c,k] = fixed_point_iteration(__)`\
`[c,k,c_all] = fixed_point_iteration(__)`


## Description

`c = fixed_point_iteration(f,x0)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?\inline&space;f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point.

`c = fixed_point_iteration(f,x0,opts)` does the same as the syntax above, but allows for the specification of optional solver parameters. `opts` is a structure with the following fields:
   - `k_max` &rightarrow; maximum number of iterations (defaults to 200)
   - `return_all` &rightarrow; returns estimates at all iteration if set to `true` (defaults to `false`)
   - `TOL` &rightarrow; tolerance (defaults to <img src="https://latex.codecogs.com/svg.latex?\inline&space;10^{-10}" title="" />)

`[c,k] = fixed_point_iteration(__)` also returns the number of iterations (`k`) performed of fixed-point iteration.

`[c,k,c_all] = fixed_point_iteration(__)` does the same as the previous syntaxes, but also returns an array (`c_all`) storing the fixed point estimates at each iteration. This syntax requires that `opts.return_all` be set to true.

## Examples and Additional Documentation

   - See "EXAMPLES.mlx" or the "Examples" tab on the File Exchange page for examples. 
   - See ["Root_Finding_Methods.pdf"](https://tamaskis.github.io/files/Root_Finding_Methods.pdf) (also included with download) for the technical documentation.
