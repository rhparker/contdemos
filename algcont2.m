
c  = 0.1;
f  = @(u,t) (u^2 - 1)*(u^2 - 4) + t*(u^2)*exp(c*u);
Df = @(u,t) [ 4*u^3 - 10*u + t*u*exp(c*u)*(2+c*u) (u^2)*exp(c*u) ];

u0 = -2;
t0 = 0;
t1 = 3;
h = 0.005;
steps = 300;

u = zeros(steps,1);
utilde = zeros(steps,1);
t = zeros(steps,1);
u(1) = u0;
utilde(1) = u0;
t(1) = t0;

threshold = 1e-3;

for n = 2:steps
    D =  Df( u(n-1), t(n-1) );
    if abs(D(1)) < threshold
        break
    end

    uprime    = -D(2)/D(1);
    utilde(n) = u(n-1) + h*uprime;

    t(n) = t(n-1) + h;
    [u(n), fvals(n), flags(n)] = fsolve( @(u) f(u,t(n)), utilde(n) );
end

%%

fontSize = 24;
lw = 3;
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
hold on;
plot(t(1:n-1),u(1:n-1), 'LineWidth', lw);
% plot(t(1:n-1),utilde(1:n-1), ':', 'LineWidth', lw);
