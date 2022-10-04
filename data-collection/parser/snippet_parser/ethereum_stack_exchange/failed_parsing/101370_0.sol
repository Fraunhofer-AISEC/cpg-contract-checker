contract C1 {
   Struct S1 {
     bool v1;
     string v2;
   }
   
   Struct S2 {
     bool v3;
     string v4;
     S1 v5;
     mapping(uint => S1) v6;
  }
  
  mapping(string => S2) public products;
}

contract C2 {
  C1 contract1;
  
  Constructor(address _add){
    contrac1 = new C1(_add);
  }

  function printProducts(){
    
    contract1.products["sample"];
  }

}
