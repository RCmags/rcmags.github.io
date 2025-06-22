%% Example of arctangent discontinuity
  % original angle
xmax = 2*pi;
x = 0:0.01:xmax;

  % arctangent
tanx = tan(x);
atanx = atan( tanx );

%% plots
figure();
hold on;
plot(x, x, "linewidth", 3);
plot(x, tanx, "linewidth", 1, "linestyle", "--");
plot(x, atanx, "linewidth", 3);
hold off;

% styling
ylim([-pi,2*pi]);
legend( "Original angle", "Tangent", "Arctan" );
xlabel("angle");
ylabel("func(angle)");
set(gca, "linewidth", 2, "fontsize", 18);
