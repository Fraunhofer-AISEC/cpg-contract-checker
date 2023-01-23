pragma solidity 0.8.6;

contract Child {
     uint public age;
     address public childAddress;
     
     constructor(uint _age) {
        age = _age;
        childAddress = address(this);
     }

     function getAge() public view returns(uint childAge) {
         childAge = age;
     }
}
