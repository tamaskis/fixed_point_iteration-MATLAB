# `fixed_point_iteration`

Calculates the fixed point of a univariate function using fixed-point iteration.


## Syntax

`c = fixed_point_iteration(f,x0)`\
`c = fixed_point_iteration(f,x0,TOL)`\
`c = fixed_point_iteration(f,x0,[],imax)`\
`c = fixed_point_iteration(f,x0,TOL,imax)`\
`c = fixed_point_iteration(__,'all')`


## Description

`c = fixed_point_iteration(f,x0)` returns the fixed of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point. The default tolerance and maximum number of iterations are `TOL = 1e-12` and `imax = 1e6`, respectively.

`c = fixed_point_iteration(f,x0,TOL)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `TOL` is the tolerance. The default maximum number of iterations is `imax = 1e6`.

`c = fixed_point_iteration(f,x0,[],imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point and `imax` is the maximum number of iterations. The default tolerance is `TOL = 1e-12`.

`c = fixed_point_iteration(f,x0,TOL,imax)` returns the fixed point of a function <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> specified by the function handle `f`, where `x0` is an initial guess of the fixed point, `TOL` is the tolerance, and `imax` is the maximum number of iterations.

`c = fixed_point_iteration(__,'all')` returns a vector, where the first element of this vector is the initial guess, all intermediate elements are the intermediate estimates of the fixed point, and the last element is the converged fixed point. This identifier 'all' may be appended to any of the syntaxes used above.


## Example

Consider the function

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img src="https://latex.codecogs.com/svg.latex?f(x)=x^{2}-1" title="f(x)=x^{2}-1" />

Enter <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> into MATLAB.

    f = @(x) x^2-1;
    
Since <img src="https://latex.codecogs.com/svg.latex?f(x)" title="f(x)" /> is a simple function, we can see, by inspection, that it will have two roots at <img src="https://latex.codecogs.com/svg.latex?x\pm1" title="x\pm1" />. Therefore, to find *both* roots using the secant method, we first use `secant_method` with an initial guess <img src="https://latex.codecogs.com/svg.latex?x_{0}=-10" title="x_{0}=-10" />, and then use `secant_method` a second time but with an initial guess <img src="https://latex.codecogs.com/svg.latex?x_{0}=10" title="x_{0}=10" />.

    % finds first root of f(x)=x^2-1 using the secant method
    root1 = secant_method(f,-10)

    % finds second root of f(x)=x^2-1 using the secant method
    root2 = secant_method(f,10)

This yields the result

    root1 =

        -1


    root2 =

         1

*NOTE: A more complex example is also provided in "Secant Method - MATLAB Implementation".*
