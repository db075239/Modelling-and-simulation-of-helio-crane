%Parametri
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
f0= 0.105;
g = 9.81; %m/s^2
psi_1 =deg2rad(17.74); 
psi_2 = deg2rad(33.62); 
l2d = l2*sqrt((l2^2)/4+r2^2); %m

J = ro_d*((1/3)*l1*(r1^2 - r1*r2 + r2^2) + l2*((l2^2/3) + r2^2)) + mm*lm^2 + mu1*lu1^2 + mu2*lu2^2;
k1 = g*(ro_d*(((r2^2)/2 - (r1^2)/2)) + mu1*lu1 - mm*lm);
k2 = ro_d*g*l2d;
k3 = mu2*g*lu2;

%% 
%DT 5
DT5= 0.5911691976;
DT6=0.9837269076;
sys ='modelX2';
[A6,B6,C6,D6] = linmod(sys,DT5,5); % State space
[b6,a6] = ss2tf(A6,B6,C6,D6,1); % Transfer function
PF6 = tf(b6,a6)
figure;
step(PF6);
grid on;
%DT 6
sys ='modelX2';
[A7,B7,C7,D7] = linmod(sys,DT6,6); % State space
[b7,a7] = ss2tf(A7,B7,C7,D7,1); % Transfer function
PF7 = tf(b7,a7)
figure;
step(PF7);
grid on;
%% Linearizacija Modela
load('realnasim');
Udt5=5;
Udt6=6;
DT5=0.5911691976;
DT6=0.9837269076;
out=sim('LinearniModeliDT');
figure;
plot(t2,Y,'m')
hold on;
plot(out.time,rad2deg(out.NelinearniOdziv),'b');
hold on;
plot(out.time,rad2deg(out.DT5),'r')
hold on;
plot(out.time,rad2deg(out.DT6),'g')
hold off;
title("Primerjava odzivov")
legend("Odziv realne naprave","Nelinearni odziv modela", "Linearizacija DT=5", "Linearizacija DT=6", "Location","Southeast")
xlabel("t[s]")
ylabel("fi[°]")
grid on;