
c = 0.1;
f = @(u,t) (u^2 - 1)*(u^2 - 4) + t*(u^2)*exp(c*u);

u0 = -2;
t0 = 0;
t1 = 3;
h = 0.005;

trange = t0:h:t1;
u = zeros(size(trange));
fvals = zeros(size(trange));
flags = zeros(size(trange));

for n = 1:length(trange)
    t = trange(n);
    [u(n), fvals(n), flags(n)] = fsolve( @(u) f(u,t), u0 );
end


%%

validu = find(flags == 1);

fontSize = 24;
lw = 3;
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(trange(validu), u(validu), 'LineWidth', lw);

