function h = plot2(x,y,r)
hold on
th = 0:pi/50:2*pi;
xunit = r * cos(th) + x;
yunit = r * sin(th) + y;
%plot(x, y,'r','MarkerSize',200*r);
fill(xunit,yunit,[0 1 1]);
vlabels = arrayfun(@(n) {sprintf('.')}, (1:1)');
Hp = text(x, y, vlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
   'center', 'BackgroundColor', 'none');
axis([0 1 0 1])
hold off
end