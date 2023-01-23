struct S { 
   uint128 a; 
   uint128 b; 
}
S test1;
function assemblyStorage() public returns (uint a, uint b, uint c, uint d, uint f, uint g){
  test1 = S(5,10);
  assembly {
     a:=sload(0)
  }
}
