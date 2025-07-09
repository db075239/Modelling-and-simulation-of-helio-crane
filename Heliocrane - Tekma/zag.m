Ts=.01
Tkon = 30
vz_t = 5*[0 1 1 2 2 3 3 4 4 5 5 6]';
vz_u =   [5 5 5 6 7 7 6 6 5 7 7 5]';
vzbujanje = [vz_t vz_u];

sim('odziv')
save signali Ts Tkon vzbujanje ynaprave