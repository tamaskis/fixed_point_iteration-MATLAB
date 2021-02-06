# `fixed_point_iteration`

Calculates the fixed point of a univariate function using fixed-point iteration.


## Syntax

`c = fixed_point_iteration(f,x0)`\
`c = fixed_point_iteration(f,x0,TOL)`\
`c = fixed_point_iteration(f,x0,[],imax)`\
`c = fixed_point_iteration(f,x0,TOL,imax)`\
`c = fixed_point_iteration(__,'all')`


## Description

`c = fixed_point_iteration(f,x0)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`c = fixed_point_iteration(f,x0,TOL)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`c = fixed_point_iteration(f,x0,[],imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`c = fixed_point_iteration(f,x0,TOL,imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`c = fixed_point_iteration(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the fixed point, and the last element is the converged fixed point. This identifier 'all' may be appended to any of the syntaxes used above.


## Example

Consider the function

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://latex.codecogs.com/svg.latex?f(x)=\sqrt{x}" title="f(x)=\sqrt{x}" />

Just by inspection, we know we should have the fixed point <img src="https://latex.codecogs.com/svg.latex?c=1" title="c=1" /> (since <img src="https://latex.codecogs.com/svg.latex?\sqrt{1}=1" title="\sqrt{1}=1" />). Therefore, for the purpose of demonstrating the convergence of fixed-point iteration, we pick an initial guess <img src="https://latex.codecogs.com/svg.latex?x_{0}=10^{10}" title="x_{0}=10^{10}" />.

    f = @(x) sqrt(x);
    c = fixed_point_iteration(f,10^10)

This yields the result

    c =

        1.0000
        

*NOTE: More complex examples are also provided in "Fixed-Point Iteration - MATLAB Implementation.pdf" and "EXAMPLES.m".*
