n = 500;
x = rand(n,1);
y = rand(n,1);
dt =  DelaunayTri(x,y);
figure(1);
triplot(dt);

vxlabels = arrayfun(@(n) {sprintf('o')}, (1:n)');
Hpl = text(x, y, vxlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
   'center', 'BackgroundColor', 'none');
[cc,r]= circumcenters(dt);
numtri = size(dt,1);
trilabels = arrayfun(@(x) {sprintf('*')}, (1:numtri)');
Htl = text(cc(:,1), cc(:,2), trilabels, 'FontWeight', 'bold', ...
   'HorizontalAlignment', 'center', 'Color', 'blue');

i = 0;
k = size(r,1);
rs=0.045; 
rc = 0;
ra = zeros(1,k);

for l=1:k 
    if ( cond1(r(l), rs) == 1 )
        x = cond2(dt, cc, l, rs);
        if x == 0 || x == 1 
            rc = rc+1;
            ra(rc) = l;
            circle(cc(l,1), cc(l,2), r(l));
        end;
    end;
end;

for l=1:rc
    
    x = dt.X(dt.Triangulation(ra(l),:), 1);
    y = dt.X(dt.Triangulation(ra(l),:), 2);
    
   xlabels = arrayfun(@(n) {sprintf('@')}, (1:3)');
Hp1 = text(x, y, xlabels, 'FontWeight', 'bold', 'HorizontalAlignment',...
   'center', 'BackgroundColor', 'none');
end;
figure(1);

figure(2);

for l = 1:n
    x= dt.X(l,1);
    y= dt.X(l,2);
    plot2(x,y,rs);
end;
for l=1:rc
    l1=ra(l);
    circle(cc(l1,1), cc(l1,2), r(l1));
    
end;


figure(2);
dt.Triangulation
dt.X