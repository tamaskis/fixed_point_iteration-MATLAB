% fixed_point_iteration  Calculates the fixed point of a univariate 
% function using fixed-point iteration.
%
%   c = fixed_point_iteration(f,x0) returns the fixed point of a function 
%   f(x) specified by the function handle f, where x0 is an initial guess 
%   of the fixed point. The default tolerance and maximum number of 
%   iterations are TOL = 1e-12 and imax = 1e6, respectively.
%
%   c = fixed_point_iteration(f,x0,TOL) returns the fixed point of a 
%   function f(x) specified by the function handle f, where x0 is an 
%   initial guess of the fixed point and TOL is the tolerance. The default 
%   maximum number of iterations is imax = 1e6.
%
%   c = fixed_point_iteration(f,x0,[],imax) returns the fixed point of a 
%   function f(x) specified by the function handle f, where x0 is an 
%   initial guess of the fixed point and imax is the maximum number of 
%   iterations. The default tolerance is TOL = 1e-12.
%
%   c = fixed_point_iteration(f,x0,TOL,imax) returns the fixed point of a 
%   function f(x) specified by the function handle f, where x0 is an 
%   initial guess of the fixed point, TOL is the tolerance, and imax is the
%   maximum number of iterations.
%
%   c = fixed_point_iteration(__,'all') returns a vector, where the first
%   element of this vector is the initial guess, all intermediate elements
%   are the intermediate estimates of the fixed point, and the last element
%   is the converged fixed point. This identifier 'all' may be appended to 
%   any of the syntaxes used above.
%
% MATLAB Central File Exchange: https://www.mathworks.com/matlabcentral/fileexchange/86992-fixed-point-iteration-fixed_point_iteration
% GitHub: https://github.com/tamaskis/fixed_point_iteration-MATLAB
%
% See "DOCUMENTATION.pdf" for additional documentation and examples. 
% Examples can also be found in EXAMPLES.m. Both of these files are 
% included with the download.
%
% Copyright (c) 2021 Tamas Kis
% Last Update: 2021-03-27



%% FUNCTION

% INPUT: f - function handle for f(x)
%        x0 - initial guess for fixed point
%        TOL - (OPTIONAL) tolerance
%        imax - (OPTIONAL) maximum number of iterations
%        output - if specified as 'all', function will returns all 
%                 intermediate estimates of the fixed point; otherwise, a 
%                 faster algorithm is used to only return the converged 
%                 fixed point
% OUTPUT: c - fixed point of f(x)
%          --> if "output" is specified as 'all', then "c" will be a
%              vector, where the first element is the initial guess, the 
%              last element is the converged fixedd point, and the other 
%              elements are intermediate estimates of the fixed point
%          --> otherwise, "c" is a single number storing the converged
%              fixed point
function c = fixed_point_iteration(f,x0,TOL,imax,output)
    
    % sets default tolerance and maximum number of iterations if not
    % specified by user
    if (nargin < 3) || isempty(TOL)
        TOL = 1e-12;
    end
    if (nargin < 4) || isempty(imax)
        imax = 1e6;
    end
    
    % decides which algorithm to use
    if nargin < 5
        return_all = false;
    else
        if strcmp(output,'all')
            return_all = true;
        else
            return_all = false;
        end
    end
    
    % initializes the error so the loop will be entered
    err = 2*TOL;
    
    % implements algorithm for fixed-point iteration where all intermediate 
    % estimates of the fixed point are also returned
    if return_all
        
        % preallocates x
        x = zeros(imax,1);
    
        % sets estimate of fixed point at the first iteration of the fixed
        % point iteration as the initial guess
        x(1) = x0;

        % fixed-point iteration
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of fixed point
            x(i+1) = f(x(i));

            % calculates error
            err = abs(x(i+1)-x(i));

            % increments loop index
            i = i+1;

        end

        % returns converged fixed point along with intermediate estimates
        % of the fixed point
        c = x(1:i);
    
    else
        
        % sets estimate of fixed point at the first iteration of the fixed
        % point iteration as the initial guess
        x_old = x0;

        % fixed-point iteration
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of fixed point
            x_new = f(x_old);
        
            % calculates error
            err = abs(x_new-x_old);
            
            % stores updated estimate of fixed point for next iteration
            x_old = x_new;
        
            % increments loop index
            i = i+1;

        end

        % returns fixed point
        c = x_old;
        
    end
      
end