%% Copyright (c) 2021 Tamas Kis

% Examples for using the fixed_point_iteration function.



%% SCRIPT SETUP

% clears variables and command window, closes all figures
clear;
clc;
close all;



%% EXAMPLE #1

% defines f(x)
f = @(x) sqrt(x);

% finds fixed point x=c of f(x) (i.e. f(c)=c)
c = fixed_point_iteration(f,10^10)



%% EXAMPLE #2

% defines g(x)=x-f(x)/f'(x)
g = @(x) (x^2+1)/(2*x);

% finds root of f(x)=x^2-1 using an initial guess x0=10
x0 = 10;
root = fixed_point_iteration(g,x0)

% plots the intermediate root estimates
plot(fixed_point_iteration(g,x0,[],[],'all'),'k*','markersize',9,...
    'linewidth',1.5);
grid on;
xlabel('Iteration','interpreter','latex','fontsize',18);
ylabel('Root Estimate','interpreter','latex','fontsize',18);



%% EXAMPLE #3 - ORIGINAL SOLUTION

% defines g(V)
g = @(V) sqrt(3000/(700*(-1.8*log10(6.9/(600000*V)))^(-2)+10));

% initial guess for flow velocity through pipe [ft/s]
V0 = 1;

% finds V
V = fixed_point_iteration(g,V0)



%% EXAMPLE #3 - ALTERNATIVE SOLUTION

% assigns function handle for g(V)
g = @(V) g_func(V);

% finds V using an initial guess of V0 = 1 ft/s
V = fixed_point_iteration(g,V0)

% defines g(V)
function V = g_func(V)
    Re = 600000*V;
    f = (-1.8*log10(6.9./Re)).^(-2);
    V = sqrt(3000./(700*f+10));
end