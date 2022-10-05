uint  val=0;
bytes   memory stringBytes = bytes(numberString);
for (uint  i =  0; i<stringBytes.length; i++) {
   uint exp = stringBytes.length - i;
   bytes1 ival = stringBytes[i];
   bytes1 jval = ival - 0x30;
   
   val +=  (jval * (10**exp));  <--doesn't compile.
}
return val;
