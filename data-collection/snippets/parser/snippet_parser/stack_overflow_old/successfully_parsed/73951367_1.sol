
pragma solidity >=0.7.0 <0.9.0;

contract Marketplace {
    mapping (uint => string) internal products; 

 function writeproduct(uint _index, string memory _product) public{
        products[_index] = _product;
    }
 function readproduct(uint _index) public view returns(string memory) {
       return products[_index];
     }
}
