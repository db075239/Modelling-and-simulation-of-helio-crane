%Test realne naprave
out=sim('RealniSistem');
U=out.vhod;
Y=out.izhod.data;
t1=out.time;
t2=out.izhod.time;
figure;
plot(t2,Y)
title("Odziv realne naprave");
xlabel("t[s]");
ylabel("fi[°]");
grid on;
