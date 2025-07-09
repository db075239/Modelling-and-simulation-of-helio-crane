%Staticna karakteristika
warning off
clear all
close all
UU = [];
YY = [];
for K=1:0.5:10
out=sim('StatKarakteristika.slx');
U=out.vhod;
Y=out.izhod;
t=out.cas;
UU = [UU;K];
YY = [YY;Y(end)];
disp(K)
end
figure
plot(UU,YY)
title("Staticna karakteristika Naprave");
xlabel("Napetost[V]");
ylabel("fi[°]");
grid on;
