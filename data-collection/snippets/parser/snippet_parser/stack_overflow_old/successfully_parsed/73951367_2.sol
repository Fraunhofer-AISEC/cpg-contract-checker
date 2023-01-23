
pragma solidity >=0.7.0 <0.9.0;

contract Marketplace {
    mapping (uint => string) public products; 

 function writeproduct(uint _index, string memory _product) public{
        products[_index] = _product;
    }
}
