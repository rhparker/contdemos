
c  = 0.1;
f  = @(u,t) (u^2 - 1)*(u^2 - 4) + t*(u^2)*exp(c*u);
Df = @(u,t) [ 4*u^3 - 10*u + t*u*exp(c*u)*(2+c*u) (u^2)*exp(c*u) ];

u0 = -2;
t0 = 0;
t1 = 3;
h = 0.01;
steps = 300;

u = zeros(steps,1);
t = zeros(steps,1);
u(1) = u0;
t(1) = t0;

U0 = [u0 ; t0];
V0 = null( Df( U0(1), U0(2) ) );

options = optimset('Jacobian', 'off');

tic;

for n = 2:steps
    V1 = null( Df( U0(1), U0(2) ) );
    if V1'*V0 < 0
        V1 = -V1;
    end
    % F = @(U) [ f( U(1),U(2) ), (U-U0)'*V1 - h ];
    U1 = fsolve( @(U) PseudoArclength(U, f, Df, U0, V1, h), U0+h*V1, options );
    u(n) = U1(1);
    t(n) = U1(2);
    U0 = U1;
    V0 = V1;
end

toc;

%%

fontSize = 24;
lw = 3;
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(t,u, 'LineWidth', lw);

%%

function [F, J] = PseudoArclength(U, f, Df, U0, V1, h)
    F = [ f( U(1),U(2) ), (U-U0)'*V1 - h ];
    J = [ Df( U(1),U(2) ) ; V1' ];
end

