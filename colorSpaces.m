clear all; close all;
global f = figure();
function selection(src,event)
  n = get(src, "value");
  plotstuff(n);
end

function plotstuff (k)
  step = 10;
  clf;
  for x = 0:step:255
    for y = 0:step:255
      z = 3*k-x-y;
      if z>=0 && z<=255
        plot3 (x, y, z, 'o', 'Color',[x/255 y/255 z/255]);
        hold on;
      else
        plot3 (x, y, z, 'o', 'Color',[0 0 0]);
        hold on;
      end
      hold on;
    end
    hold on;
  end
  xlabel ("R");
  ylabel ("G");
  zlabel ("B");
  title (k);
  xlim([0 255]);
  ylim([0 255]);
  zlim([0 255]);
  slider = uicontrol (                   ...
           "style", "slider",                ...
           "Units", "normalized",            ...
           "position", [0.1, 0.01, 0.8, 0.05], ...
           "min", 0,                         ...
           "max", 255,                       ...
           "value", k,                       ...        
           "callback", {@selection}
       );
end

plotstuff(10);