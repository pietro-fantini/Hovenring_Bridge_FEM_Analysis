acc2=acc-mean(acc);

k=0;

for i = 2:(length(acc2)-1)
    
    if acc2(i-1)<acc2(i) && acc2(i+1)<acc2(i)
        k=k+1;
        p(k)=acc2(i);
        timep(k)=time(i);
    end
    
end

for k = 1:(length(p)-4)
    d(k)=log((p(k)/p(k+4)))/4;
    h(k)=d(k)/(2*pi);
end

figure, hold on, grid on
plot(time,acc2);
plot(timep,p,'o')
xlabel('Time [s]')
ylabel('Acceleration [m/s^2]')
title('Time history of free decay')

timep(length(h)+1:end)=[];
figure, hold on, grid on,axis tight
plot(timep,h,'o')
xlabel('Time [s]')
ylabel('h')
title('Damping ratio')

h=movmean(h,80);

figure, hold on, grid on
plot(timep,h,'o')
xlabel('Time [s]')
ylabel('h')
title('Moving average of damping ratio')

p(length(h)+1:end)=[];

for k = 1:(length(p)-4)
    T(k)=(timep(k+4)-timep(k))/4;
    w(k)=(T(k))^(-1);
end

timep(length(timep)-3:end)=[];

figure, hold on, grid on
plot(timep,w,'o')
xlabel('Time [s]')
ylabel('Frequency [Hz]')
title('Natural frequencies')



