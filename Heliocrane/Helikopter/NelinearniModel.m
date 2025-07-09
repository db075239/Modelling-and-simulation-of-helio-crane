clear all
close all
%%
ro_d = 1.13; %kg/m^2
mm = 0.13; %kg
mu1 = 0.145; %kg
mu2 = 0.024; %kg
l1 = 0.54; %m
l2 = 0.128; %m
deltal2=0.005;
r1 = 0.34; %m
r2 = 0.2; %m
lu1 = 0.165; %m
lu2 = 0.24; %m
lm = 0.38; %m
f = 3; %kg/s
f0=0.105;
g = 9.81; %m/s^2
psi_1=deg2rad(17.74); 
psi_2=deg2rad(33.62); 
l2d = l2*sqrt((l2^2)/4+r2^2); %m

J = ro_d*((1/3)*l1*(r1^2 - r1*r2 + r2^2) + l2*((l2^2/3) + r2^2)) + mm*lm^2 + mu1*lu1^2 + mu2*lu2^2;
% k1 = g*(ro_d*(((r2^2)/2 - (r1^2)/2)) + mu1*lu1 - mm*lm);
% k2 = ro_d*g*l2d;
% k3 = mu2*g*lu2;
k1=-0.62324;
k2=0.22329;
k3=0.085677;

out1=sim('modelX');
U1=out1.U;
time1=out1.time;
fi=out1.fi.Data;
t1=out1.fi.Time;
fi1=rad2deg(fi);
%figure(1);
%plot(time,F)
hold on
subplot(2,1,1)
plot(time1,U1);
xlabel('t[s]')
ylabel('U[V]')
title('Vzbujanje')
hold off;
hold on
subplot(2,1,2)
plot(t1,fi1);
xlabel('t[s]')
ylabel('fi[°]')
title('Nelinearni model-Odziv')
grid on;
hold off;