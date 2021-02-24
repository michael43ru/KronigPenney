function f = F(E, m, a, b, U0)
h = 1.054571817 * 10^(-27);
E_1 = E / (6.2415 * 10^11);
U0_1 = U0 / (6.2415 * 10^11);
mu = sqrt(2*m*E_1/(h^2));
lambda = sqrt(2*m*(E_1-U0_1)/(h^2));
a_1 = a * 100;
b_1 = b * 100;
f = cos(mu*a_1).*cos(lambda*b_1) - (mu.^2 + lambda.^2).*sin(mu*a_1).*sin(lambda*b_1)./(2*mu.*lambda);
end