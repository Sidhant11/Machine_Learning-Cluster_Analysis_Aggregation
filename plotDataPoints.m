%%Written by Sidhant Pednekar
function plotDataPoints(X, idx, K)

% Create palette
palette = hsv(K + 1);
colors = palette(idx, :);

% Plot the data
scatter3(X(:,1), X(:,2), X(:,3), 50, colors,'fill');
%Making the graph pretty
hXLabel = xlabel('x','interpreter','latex', 'fontweight','bold','FontSize',22);
hYLabel = ylabel('y', 'interpreter','latex','fontweight','bold','FontSize',28);
set([hXLabel, hYLabel], ...
     'FontName'   , 'AvantGarde');
axis on;
set(gca, ...
  'Box'         , 'on'     , ...
  'TickDir'     , 'in'     , ...
  'TickLength'  , [.02 .02] , ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'on'      , ...
  'YMinorGrid'  , 'off'      , ...
  'XMinorGrid'  , 'off'      , ...
  'XGrid'       , 'on'      , ...
  'XColor'      , [.3 .3 .3], ...
  'YColor'      , [.3 .3 .3], ...
  'LineWidth'   , 2         );


ax = gca;
set(gca,'fontsize',16);
ax.GridLineStyle = '--';

end
