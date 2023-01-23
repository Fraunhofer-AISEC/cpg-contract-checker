function withdraw() returns (bool) {
address x = 0x0123;
uint amount = 100 ether;
if (x.send(amount))
   return true;
else
   return false;
}
