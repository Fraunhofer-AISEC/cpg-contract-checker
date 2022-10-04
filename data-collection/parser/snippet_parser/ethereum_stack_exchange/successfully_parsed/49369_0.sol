 function financialReputation( ufixed xb , ufixed xs) returns (uint vb , ufixed vs) {

vb = - (1 / 2**(uint(xb / 5) )) +1;
vs = - (1 / ufixed(2.7182818285)**(ufixed(xs / 2000)) ) +1;

return (vb,vs);
}
