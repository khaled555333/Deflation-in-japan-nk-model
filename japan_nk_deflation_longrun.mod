var x pi i r_n r_real;
varexo e_rn;
parameters sigma kappa beta phi_pi phi_x rho_rn rho_i r_n0;

sigma   = 1.5;
kappa   = 0.01;
beta    = 0.99;
phi_pi  = 1.5;
phi_x   = 0.5;
rho_rn  = 0.98;
rho_i   = 0.80;
r_n0    = 0.005;

model;
x = x(+1) - (1/sigma)*(i - pi(+1) - r_n);
pi = beta*pi(+1) + kappa*x;
i = max(0, rho_i*i(-1) + (1 - rho_i)*(r_n + phi_pi*pi + phi_x*x));
r_n = rho_rn*r_n(-1) + (1 - rho_rn)*r_n0 + e_rn;
r_real = i - pi;
end;

initval;
x      = 0;
pi     = 0;
r_n    = r_n0;
i      = r_n0;
r_real = r_n0;
end;

steady(solve_algo=0);
check;

shocks;
var e_rn;
periods 1;
values -0.014;
end;

perfect_foresight_setup(periods=60);
perfect_foresight_solver;

T         = size(oo_.endo_simul, 2);
qtr       = 1:T;
x_sim     = oo_.endo_simul(1,:) * 100;
pi_sim    = oo_.endo_simul(2,:) * 100;
i_sim     = oo_.endo_simul(3,:) * 100;
rn_sim    = oo_.endo_simul(4,:) * 100;
rreal_sim = oo_.endo_simul(5,:) * 100;

plot_titles = {'Output Gap (x)', 'Inflation (pi_t)', 'Nominal Rate (i)', 'Natural Rate (r_n)', 'Real Rate (r_real)'};
plot_series = {x_sim, pi_sim, i_sim, rn_sim, rreal_sim};

figure(1);
for k = 1:5
  subplot(3,2,k);
  plot(qtr, plot_series{k}, 'b-', 'LineWidth', 1);
  title(plot_titles{k});
  xlabel('Quarters');
  ylabel('%');
  grid on;
end

fid = fopen('nk_data.js', 'w');
fprintf(fid, 'const Q=[%s];\n',  sprintf('%d,',   qtr));
fprintf(fid, 'const X=[%s];\n',  sprintf('%.4f,', x_sim));
fprintf(fid, 'const PI=[%s];\n', sprintf('%.4f,', pi_sim));
fprintf(fid, 'const I=[%s];\n',  sprintf('%.4f,', i_sim));
fprintf(fid, 'const RN=[%s];\n', sprintf('%.4f,', rn_sim));
fprintf(fid, 'const RR=[%s];\n', sprintf('%.4f,', rreal_sim));
fclose(fid);
