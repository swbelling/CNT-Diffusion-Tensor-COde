clear all

pos_datax = readtable('particle_dispalcement.x_61_single_random.dat');
pos_datax = pos_datax(2:1001,2:2001);
pos_datax = table2array(pos_datax);

pos_datay = readtable('particle_dispalcement.y_61_single_random.dat');
pos_datay = pos_datay(2:1001,2:2001);
pos_datay = table2array(pos_datay);

pos_dataz = readtable('particle_dispalcement.z_61_single_random.dat');
pos_dataz = pos_dataz(2:1001,2:2001);
pos_dataz = table2array(pos_dataz);

% pos_data(isnan(pos_data))=0;
sizes = size(pos_datax);
particle_num = sizes(2);
timesteps = 1000;
dt = 1e-15;
for j = 1:timesteps
for i = 1:particle_num
    xdata(i) = (pos_datax(j,i));
    ydata(i) = (pos_datay(j,i));
    zdata(i) = (pos_dataz(j,i));
end
Dxx(j) = ((sum(xdata.^2)/particle_num-(sum(xdata)/particle_num)^2)/(2*j*dt));
Dyy(j) = ((sum(ydata.^2)/particle_num-(sum(ydata)/particle_num)^2)/(2*j*dt));
Dzz(j) = ((sum(zdata.^2)/particle_num-(sum(zdata)/particle_num)^2)/(2*j*dt));

Dxy(j) = ((sum(xdata.*ydata)/particle_num-(sum(xdata)/particle_num)*sum(ydata)/particle_num)/(2*j*dt));
Dxz(j) = ((sum(xdata.*zdata)/particle_num-(sum(xdata)/particle_num)*sum(zdata)/particle_num)/(2*j*dt));
Dyz(j) = ((sum(ydata.*zdata)/particle_num-(sum(ydata)/particle_num)*sum(zdata)/particle_num)/(2*j*dt));
end



pos_datax = readtable('particle_dispalcement.x_61_bundle_random.dat');
pos_datax = pos_datax(2:1001,2:2001);
pos_datax = table2array(pos_datax);

pos_datay = readtable('particle_dispalcement.y_61_bundle_random.dat');
pos_datay = pos_datay(2:1001,2:2001);
pos_datay = table2array(pos_datay);

pos_dataz = readtable('particle_dispalcement.z_61_bundle_random.dat');
pos_dataz = pos_dataz(2:1001,2:2001);
pos_dataz = table2array(pos_dataz);

% pos_data(isnan(pos_data))=0;
sizes = size(pos_datax);
particle_num = sizes(2);
timesteps = 1000;
dt = 1e-15;
for j = 1:timesteps
for i = 1:particle_num
    xdata(i) = (pos_datax(j,i));
    ydata(i) = (pos_datay(j,i));
    zdata(i) = (pos_dataz(j,i));
end
Dxx_spacing(j) = ((sum(xdata.^2)/particle_num-(sum(xdata)/particle_num)^2)/(2*j*dt));
Dyy_spacing(j) = ((sum(ydata.^2)/particle_num-(sum(ydata)/particle_num)^2)/(2*j*dt));
Dzz_spacing(j) = ((sum(zdata.^2)/particle_num-(sum(zdata)/particle_num)^2)/(2*j*dt));

Dxy_spacing(j) = ((sum(xdata.*ydata)/particle_num-(sum(xdata)/particle_num)*sum(ydata)/particle_num)/(2*j*dt));
Dxz_spacing(j) = ((sum(xdata.*zdata)/particle_num-(sum(xdata)/particle_num)*sum(zdata)/particle_num)/(2*j*dt));
Dyz_spacing(j) = ((sum(ydata.*zdata)/particle_num-(sum(ydata)/particle_num)*sum(zdata)/particle_num)/(2*j*dt));
end
tvec = linspace(0,dt*timesteps,timesteps);

plot(tvec./(1e-12),Dxx*1e4,'r--','Linewidth',2)
xlabel('Time (ps)','FontSize',24)
ylabel('Diffusion Tensor Element (cm^2/s)')
hold on
plot(tvec./(1e-12),Dyy*1e4,'r:','Linewidth',2)

hold on
plot(tvec./(1e-12),Dzz*1e4,'r-','Linewidth',2)

hold on
plot(tvec./(1e-12),Dxx_spacing*1e4,'k--','Linewidth',2)

hold on
plot(tvec./(1e-12),Dyy_spacing*1e4,'k:','Linewidth',2)

hold on
plot(tvec./(1e-12),Dzz_spacing*1e4,'k-','Linewidth',2)
set(gca,'FontSize',14)
legend('Dxx Single CNT','Dyy Single CNT','Dzz Single CNT','Dxx Bundle','Dyy Bundle','Dzz Bundle')
ylim([0 30])
grid on