function foo( ... ) returns (uint) {
uint res;

res = globalPublicVariable;
res = res*res*res+ 2*res + 1;

return(res);
}
