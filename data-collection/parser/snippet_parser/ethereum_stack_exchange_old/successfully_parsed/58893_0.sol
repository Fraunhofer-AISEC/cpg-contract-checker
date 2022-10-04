pragma solidity ^0.4.6;
contract Product{ 
  struct ProductStruct {  
    bytes32 name;  
    bool status;  
  }  
  mapping(uint => ProductStruct) public productStructs;

  function updateProduct(bytes32 name, uint ID) returns(bool success) {
    productStructs[ID].name = name;
    productStructs[ID].status = true;
    return true;
  }
}

contract External {
  Product p;
  function External(address addr) {
    p = Product(addr);
  }


 function readProduct(uint u) constant returns(bytes32 name, bool status) {
      p.productStructs(u);
    return(p.productStructs(u)); 
  }


  function readProduct(uint u) constant returns(bytes32 name) {
    return (p.productStructs(u).name); 
  }
}
