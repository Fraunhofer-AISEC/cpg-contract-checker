function sub(uint8 a, uint8 b) public returns(uint8) {
   require(b <= a);
   uint8 c = a - b;
   return c;
}
