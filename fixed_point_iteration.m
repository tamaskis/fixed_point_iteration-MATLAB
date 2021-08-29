%==========================================================================
%
% fixed_point_iteration  Calculates the fixed point of a univariate 
% function using fixed-point iteration.
%
%   c = fixed_point_iteration(f,x0)
%   c = fixed_point_iteration(f,x0,opts)
%
% Copyright © 2021 Tamas Kis
% Last Update: 2021-08-28
% Website: https://tamaskis.github.io
% Contact: tamas.a.kis@outlook.com
%
% TECHNICAL DOCUMENTATION:
% https://tamaskis.github.io/documentation/Fixed_Point_Iteration.pdf
%
% REFERENCES:
%   [1] Burden and Faires, "Numerical Analysis", 9th Ed. (pp. 56-66)
%
%--------------------------------------------------------------------------
%
% ------
% INPUT:
% ------
%   f       - (function_handle) f(x)
%   x0      - (1×1 double) initial guess for fixed point
%   opts    - (OPTIONAL) (struct) solver options structure
%       • imax          - (1×1 double) maximimum number of iterations
%       • return_all    - (logical) all intermediate fixed point estimates
%                         are returned if set to "true"; otherwise, a
%                         faster algorithm is used to return only the 
%                         converged fixed point
%       • TOL           - (1×1 double) tolerance
%       • warnings      - (logical) true if any warnings should be
%                         displayed, false if not
%
% -------
% OUTPUT:
% -------
%   c       - (1×1 or n×1 double) fixed point of f(x)
%           	--> If "return_all" is specified as "true", then "c" will
%                   be a vector, where the first element is the initial
%                   guess, the last element is the converged fixed point, 
%                   and the other elements are intermediate estimates of 
%                   the fixed point.
%               --> Otherwise, "c" is a single number storing the converged
%                   fixed point.
%
%==========================================================================
function c = fixed_point_iteration(f,x0,opts)
    
    % ----------------------------------
    % Sets (or defaults) solver options.
    % ----------------------------------
    
    % sets maximum number of iterations (defaults to 1e6)
    if (nargin < 3) || isempty(opts) || ~isfield(opts,'imax')
        imax = 1e6;
    else
        imax = opts.imax;
    end
    
    % determines return value (defaults to only return converged root)
    if (nargin < 3) || isempty(opts) || ~isfield(opts,'return_all')
        return_all = false;
    else
        return_all = opts.return_all;
    end
    
    % sets tolerance (defaults to 1e-12)
    if (nargin < 3) || isempty(opts) || ~isfield(opts,'TOL')
        TOL = 1e-12;
    else
        TOL = opts.TOL;
    end
    
    % determines if warnings should be displayed (defaults to display)
    if (nargin < 3) || isempty(opts) || ~isfield(opts,'warnings')
        warnings = true;
    else
        warnings = opts.warnings;
    end
    
    % -----------------------------------------------------
    % "Return all" implementation of fixed-point iteration.
    % -----------------------------------------------------
    
    if return_all
        
        % preallocates x
        x = zeros(imax,1);
    
        % inputs initial guess for fixed point into x vector
        x(1) = x0;

        % initializes the error so the loop will be entered
        err = 2*TOL;
    
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

        % displays warning if maximum number of iterations reached
        if (i == imax) && warnings
            warning(strcat('The method failed after n=',num2str(imax),...
                ' iterations.'));
        end
        
        % returns converged fixed point along with intermediate fixed point
        % estimates
        c = x(1:i);
    
    % -----------------------------------------------
    % "Fast" implementation of fixed-point iteration.
    % -----------------------------------------------
    
    else
        
        % sets fixed point estimate at the first iteration of the fixed
        % point iteration as the initial guess
        x_old = x0;
        
        % initializes x_new so its scope isn't limited to the while loop
        x_new = 0;
        
        % initializes the error so the loop will be entered
        err = 2*TOL;

        % fixed-point iteration
        i = 1;
        while (err > TOL) && (i < imax)

            % updates estimate of fixed point
            x_new = f(x_old);
        
            % calculates error
            err = abs(x_new-x_old);
            
            % stores current fixed point estimate for next iteration
            x_old = x_new;
        
            % increments loop index
            i = i+1;

        end

        % displays warning if maximum number of iterations reached
        if (i == imax) && warnings
            warning(strcat('The method failed after n=',num2str(imax),...
                ' iterations.'));
        end
        
        % returns converged fixed point
        c = x_new;
        
    end
      
end