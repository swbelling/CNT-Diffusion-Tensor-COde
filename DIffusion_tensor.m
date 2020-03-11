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
hold on
subplot(2,1,1)
tvec = linspace(0,dt*timesteps,timesteps);
plot(tvec,(Dxx),'Linewidth',2);
hold on
plot(tvec,(Dyy),'Linewidth',2);
hold on
plot(tvec,(Dzz),'Linewidth',2);
legend("Dxx","Dyy","Dzz")
xlabel("Time [s]")
ylabel("Diffusion Tensor Element [m^2/s]")

subplot(2,1,2)
plot(tvec,(Dxy),'Linewidth',2);
hold on
plot(tvec,(Dxz),'Linewidth',2);
hold on
plot(tvec,(Dyz),'Linewidth',2);
legend("Dxy","Dxz","Dyz")
xlabel("Time [s]")
ylabel("Diffusion Tensor Element [m^2/s]")

tensorxx = Dxx(1000);
tensoryy = Dyy(1000);
tensorzz = Dzz(1000);
tensorxz = Dxz(1000);
tensorxy = Dxy(1000);
tensoryz = Dyz(1000);

tensor = [tensorxx,tensorxy,tensorxz;tensorxy,tensoryy,tensoryz;tensorxz,tensoryz,tensorzz];
[vecs,vals] = eig(tensor);
final_y = pos_datay(1000,:);
ymax = max(final_y);
ymin = min(final_y);
numlayers = 10;
yrange = linspace(ymin,ymax,numlayers+1);
layerpopulation = zeros(numlayers,1);
for i = 1:2000
    if final_y(i)>yrange(10)
        layerpopulation(10)=layerpopulation(10)+1;
    else if final_y(i)>yrange(9)
            layerpopulation(9)=layerpopulation(9)+1;
        else if final_y(i)>yrange(8)
                layerpopulation(8)=layerpopulation(8)+1;
            else if final_y(i)>yrange(7)
                    layerpopulation(7)=layerpopulation(7)+1;
                else if final_y(i)>yrange(6)
                        layerpopulation(6)=layerpopulation(6)+1;
                    else if final_y(i)>yrange(5)
                        layerpopulation(5)=layerpopulation(5)+1;
                        else if final_y(i)>yrange(4)
                                layerpopulation(4)=layerpopulation(4)+1;
                            else if final_y(i)>yrange(3)
                                    layerpopulation(3)=layerpopulation(3)+1;
                                else if final_y(i)>yrange(2)
                                        layerpopulation(2) = layerpopulation(2)+1;
                                    else if final_y(i)>yrange(1)
                                            layerpopulation(1)=layerpopulation(1)+1;
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
figure
plot(layerpopulation)
            
        
    
    
    
    
    
    
    
    
    
    
    