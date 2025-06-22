%% Continuity filter | Example
xmax = 8*pi;
param = (0:0.001:1) * xmax;  % need enough steps to ensure convergence

  % original angle
rot_sin = 8*sin(param);

  % arctangent
sinr = sin(rot_sin);
cosr = cos(rot_sin);
rot_est = atan2(sinr, cosr);

   % filter
filter = continuityFilter(rot_est);

%% Plot figure
figure();

hold on;
  % curves
plot(rot, rot_sin, "linewidth", 2);
plot(rot, rot_est, "linewidth", 2);
plot(rot, filter, "linestyle", "--", "linewidth", 5);
  % limit lines
plot( [0, xmax], [pi, pi], "linestyle", ":", "color", "b");
plot( [0, xmax], [-pi, -pi], "linestyle", ":", "color", "b");
text( xmax*0.5, (pi + 0.5), "PI", "fontsize", 20, "color", "b");
text( xmax*0.5, -(pi + 0.5), "-PI", "fontsize", 20, "color", "b");
hold off;
  % styling
legend( "Original angle", "Arctan", "Filter" );
xlabel("time");
ylabel("angle (rad)");
set(gca, "linewidth", 2, "fontsize", 18);


