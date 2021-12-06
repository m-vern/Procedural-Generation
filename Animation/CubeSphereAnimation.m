clc;clear;close;

size = 9;
step = 7;
t = 0.001;
lw = 3;
lc = 'black';
fa=.5;

a=zeros(size-1);
b=zeros(size-1);
c=zeros(size-1);

for i=0:size-2
    a(:,i+1) = [(i-(0.5*size-1))/(0.5*size-1)];
    b(i+1,:) = [(i-(0.5*size-1))/(0.5*size-1)];
    c(:,i+1) = [1];
end

x=a;
y=b;
z=c;

s1 = surf(x,y,z, 'FaceAlpha',fa,'FaceColor','green','EdgeColor',lc, 'Linewidth',lw); hold on
s2 = surf(x,z,-y, 'FaceAlpha',fa,'FaceColor','magenta','EdgeColor',lc, 'Linewidth',lw); hold on
s3 = surf(-z,x,-y, 'FaceAlpha',fa,'FaceColor','yellow','EdgeColor',lc, 'Linewidth',lw); hold on
s4 = surf(-x,-y,-z, 'FaceAlpha',fa,'FaceColor','blue','EdgeColor',lc, 'Linewidth',lw); hold on
s5 = surf(-x,-z,y, 'FaceAlpha',fa,'FaceColor','cyan','EdgeColor',lc, 'Linewidth',lw); hold on
s6 = surf(z,-x,y, 'FaceAlpha',fa,'FaceColor','#D95319','EdgeColor',lc, 'Linewidth',lw); hold on

set(gcf, 'Position', get(0, 'Screensize'));
camorbit(360,360)
cameratoolbar;
pause(2)

fig = uifigure;
fig.Name = "Animation Speed";
fig.Position(3:4) = [300 100];
sld = uislider(fig,'Value',50);
sld.Position = [75 48.5 150 3];
movegui(fig,'northeast');
sld.Limits = [.0001 .1];
sld.Value = t;
pause(2)

for i=1:(size-1)^2
    for i2=1:step
        t=sld.Value;
        
        x(i)=(a(i)*(sqrt(1-(b(i)^2/2)-(c(i)^2/2)+(b(i)^2*c(i)^2)/3))^(i2/step));
        y(i)=(b(i)*(sqrt(1-(c(i)^2/2)-(a(i)^2/2)+(c(i)^2*a(i)^2)/3))^(i2/step));
        z(i)=(c(i)*(sqrt(1-(a(i)^2/2)-(b(i)^2/2)+(a(i)^2*b(i)^2)/3))^(i2/step));

        s1.XData = x;
        s1.YData = y;
        s1.ZData = z;
        s2.XData = x;
        s2.YData = z;
        s2.ZData = -y;
        s3.XData = -z;
        s3.YData = x;
        s3.ZData = -y;
        s4.XData = -x;
        s4.YData = -y;
        s4.ZData = -z;
        s5.XData = -x;
        s5.YData = -z;
        s5.ZData = y;
        s6.XData = z;
        s6.YData = -x;
        s6.ZData = y;

        drawnow;
        camorbit(0.5,0,'camera')
        pause(t);
    end
end


