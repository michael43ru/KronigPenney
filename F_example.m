U0 = -4;
E_0 = [U0:0.0001:25];
a = 5 * 10^(-10);
b = 2 * 10^(-9);
m = 9.1094*10^(-28);
f = F(E_0, m, a, b, U0);
figure; hold on; grid on; plot(E_0, f);
k_0 = acos(f)/(a+b);
len = length(k_0);
k = 0;
E = 0;
for i = 1:len
    k(i) = -k_0(len-i+1);
    E(i) = E_0(len-i+1);
end
for i = 1:len
    k(i+len) = k_0(i);
    E(i+len) = E_0(i);
end
figure; hold on; grid on; plot(k, E);