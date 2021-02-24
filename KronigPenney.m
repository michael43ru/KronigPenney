function E = KronigPenney(k,m,a,b,U0,Emax)
%E_peak = [0, 0.15, 0.84, 1.925, 3.07, 3.99, 5.46, 7.235, 8.88, 10.105, 12.02, 14.3575, 16.745,';
E_0 = [0:0.001:Emax];
E_peak = 0;
K0 = K(E_0, m, a, b, U0);
for i = 2:(length(E_0)-1)
    if (not(isreal(K0(i))) & isreal(K0(i+1))) | (isreal(K0(i)) & not(isreal(K0(i+1))))
        E_peak(length(E_peak)+1) = E_0(i);
    end
end
E_peak(length(E_peak)+1) = Emax;
E_a = 0;
E_b = Emax;
E_c = 0;
N = [1:1:length(k)];
for i = 1:length(k)
    N(i) = 1;
end
for i = 1:length(k)
    for j = 2:2:(length(E_peak)-1)
        E_a = E_peak(j);
        E_b = E_peak(j+1);
        while ((abs(K(E_a, m, a, b, U0)) - abs(k(i)))*(abs(K(E_b, m, a, b, U0)) - abs(k(i))) <= 0) & (abs((abs(K(E_a, m, a, b, U0)) - abs(k(i)))/abs(k(i)))) > 0.004 | (abs(E_a - E_b) > 0.01)
            E_c = (E_a + E_b) / 2;
            if (abs(K(E_c, m, a, b, U0)) - abs(k(i)))*(abs(K(E_a, m, a, b, U0)) - abs(k(i))) >= 0
                E_a = E_c;
            else
                E_b = E_c;
            end
        end
        if ((abs(K(E_a, m, a, b, U0)) - abs(k(i)))*(abs(K(E_b, m, a, b, U0)) - abs(k(i))) <= 0 & (abs((K(E_a, m, a, b, U0) - abs(k(i)))/abs(k(i))) < 0.005))
            E(i, N(i)) = E_a;
            N(i) = N(i) + 1;
        end
    end
end