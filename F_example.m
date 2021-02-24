U0 = -4;
E = [U0:0.00001:25];
a = 5 * 10^(-10);
b = 2 * 10^(-9);
m = 9.1094*10^(-28);
f = F(E, m, a, b, U0);
figure; hold on; grid on; plot(E, f);
k = acos(f)/(a+b);
figure; hold on; grid on; plot(E, k);