clc; clear
reliability = 0:0.1:1;
initial_cost = 100*exp(reliability-0.6);
post_implementation_cost = 100./(exp(reliability-0.6));
total_cost = initial_cost + post_implementation_cost;
cost_effective_point_y = min(total_cost);
[row,col] = find(total_cost==cost_effective_point_y);
cost_effective_point_x = reliability(row,col);
optimal_reliability = cost_effective_point_x
lowest_initial_cost = initial_cost(4)
highest_life_cycle_cost = total_cost(4)
figure(1)
set(gcf,'Name','LIFECYCLE COST AND RELIABILITY')
title('Lifecycle cost and Reliability')
hold on
plot(reliability,initial_cost,'r','LineWidth',2)
hold on
plot(reliability,post_implementation_cost,'b','LineWidth',2);
hold on
plot (reliability, total_cost, 'g','LineWidth',2);
hold on
plot(cost_effective_point_x,cost_effective_point_y, 'ms','LineWidth',2);
hold on
plot(cost_effective_point_x,0, 'ks','LineWidth',2);
hold on
plot(0.3,lowest_initial_cost, 'r*', 'LineWidth', 5);
hold on
plot(0.3,highest_life_cycle_cost, 'rs', 'LineWidth', 2);
txt1 = sprintf('Minimal lifecycle cost = %.2f Rs',cost_effective_point_y);
txt2 = sprintf('Lowest initial cost = %.2f Rs', lowest_initial_cost);
txt3 = sprintf('Highest life cycle cost = %.2f Rs', highest_life_cycle_cost);
legend('Initial cost','Post implementationcost','Total cost', txt1,'Optimal reliability',txt2,txt3);
grid on;
xlabel('Reliability')
ylabel('Cost')
axis([0 1 0 350])