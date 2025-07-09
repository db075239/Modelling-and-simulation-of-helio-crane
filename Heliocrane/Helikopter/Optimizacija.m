clear all;
close all;

% Parametri modela
ro_d = 1.13; % kg/m^2
mm = 0.13; % kg
mu1 = 0.145; % kg
mu2 = 0.024; % kg
l1 = 0.54; % m
l2 = 0.128; % m
deltal2 = 0.005; 
r1 = 0.34; % m
r2 = 0.2; % m
lu1 = 0.165; % m
lu2 = 0.24; % m
lm = 0.38; % m
f = 3; % kg/s
f0 = 0.105;
g = 9.81; % m/s^2
psi_1 = deg2rad(17.74); 
psi_2 = deg2rad(33.62); 
l2d = l2 * sqrt((l2^2) / 4 + r2^2); % m

% izracun parametara
J = ro_d * ((1 / 3) * l1 * (r1^2 - r1 * r2 + r2^2) + l2 * ((l2^2 / 3) + r2^2)) + mm * lm^2 + mu1 * lu1^2 + mu2 * lu2^2;
k1 = g * (ro_d * (((r2^2) / 2 - (r1^2) / 2)) + mu1 * lu1 - mm * lm);
k2 = ro_d * g * l2d;
k3 = mu2 * g * lu2;

%vhod
Ts=.01
Tkon = 30
vz_t = 5*[0 1 1 2 2 3 3 4 4 5 5 6]';
vz_u =   [5 5 5 6 7 7 6 6 5 7 7 5]';
vzbujanje = [vz_t vz_u];
% figure;
% plot(vzbujanje(:,1),vzbujanje(:,2:end))
% ylabel('u [V]');
% xlabel('t [s]');
% Začetne vrednosti
initialParams=[k1 k2];
%opts = simset('SrcWorkspace','current','DstWorkspace','current');
% Optimizacija
optimalParams = fminsearch(@objectiveFunction, initialParams);

% Ispis optimizovanih parametara
disp('Optimizovani parametri:');
disp(['k1 = ', num2str(optimalParams(1))]);
disp(['k2 = ', num2str(optimalParams(2))]);
% disp(['k3 = ', num2str(optimalParams(3))]);
