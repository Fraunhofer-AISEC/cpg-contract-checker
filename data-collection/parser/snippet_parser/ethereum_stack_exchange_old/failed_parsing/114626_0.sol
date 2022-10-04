uint mantissa = 1e3;
uint rate = 1;
uint periods = 69;
uint out = mantissa;
for(uint i=0; i < periods; i++){
  out = out * (mantissa + rate);
  out = out / mantissa;
}
