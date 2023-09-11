
c = 0.1;
f = @(u,t) (u.^2 - 1).*(u.^2 - 4) + t*(u.^2).*exp(c*u);

uu = -2.1:0.01:2.1;

fontSize = 36;
lw = 5;
tval = 0.25;

figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(uu, f(uu,tval), 'LineWidth', lw);
grid on;
xticks(-2:1:2)


%%

tt = 0:0.01:1.2;

fontSize = 30;
lw = 3;
figure('DefaultAxesFontSize',fontSize);
set(gca,'fontname','times');
set(groot,'defaultAxesTickLabelInterpreter','latex');  
set(groot,'defaulttextinterpreter','latex');
set(groot,'defaultLegendInterpreter','latex');
plot(tt, tt.^3, 'LineWidth', lw, 'Color', 'blue');
hold on;
b = 0.4;
h = 0.48;
xpts = [b b+h];
ypts = xpts.^3;
ytilde = ypts(1)+h*3*pts(1).^2;
xticks(xpts)
xticklabels({'$\lambda_{n-1}$','$\lambda_{n}$'})
arrow( [xpts(1) ypts(1)], [xpts(2) ypts(1)+h*3*pts(1).^2], 'LineWidth', 2, 'Color', 'red')
plot([xpts(1) xpts(2)],[ypts(1) ypts(1)], ':k', 'LineWidth', 2)
plot([xpts(2) xpts(2)],[ypts(1) ytilde], ':k', 'LineWidth', 2)
plot([xpts(1) xpts(2) xpts(2)],[ypts(1) ytilde ypts(2)], '.k', 'MarkerSize', 40)
text(mean(xpts), ypts(1)-0.1, '$h$', 'FontSize', fontSize)
text(xpts(1)-0.07, ypts(1)+0.125, '$u_{n-1}$', 'FontSize', fontSize)
text(xpts(2)+0.015, ytilde-0.05, '$\tilde{u}_n$', 'FontSize', fontSize)
text(xpts(2)+0.015, ypts(2)-0.05, '$u_n$', 'FontSize', fontSize)
text(xpts(2)-0.08, ytilde+0.12, '$u''(\lambda_{n-1})$', 'FontSize', fontSize,'Color','red')
text(xpts(2)-0.22, ypts(2)+0.2, '$F(u,\lambda)=0$', 'Fontsize', fontSize, 'Color', 'blue');
set(gca,'ytick',[])
ylim([-0.5 1.2])
xlim([0.2 1])
ylabel('$u$')

