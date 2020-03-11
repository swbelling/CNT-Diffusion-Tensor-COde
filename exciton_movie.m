for i = 1:2000
    plot3(pos_datax(i,:),pos_datay(i,:),pos_dataz(i,:),'ro')
    xlim([-400e-9,400e-9])
    ylim([-400e-9,400e-9])
    zlim([-400e-9,400e-9])
    xlabel('x')
    grid on
    pause(0.01);
end
count = 0;
% for i = 1:particle_num
%     for j = 2:timesteps
%         if abs(pos_datax(j,i)-pos_datax(j-1,i)) > 20e-9 ||abs(pos_datay(j,i)-pos_datay(j-1,i)) > 20e-9 ||abs(pos_dataz(j,i)-pos_dataz(j-1,i)) > 20e-9
%             count=count+1
%         end
%     end
% end