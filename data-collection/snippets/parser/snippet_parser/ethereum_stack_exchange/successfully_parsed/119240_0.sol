
pragma solidity ^0.8.9;

interface ChildInterface {
    function getStateVariable() external returns(uint);
}

contract Child is ChildInterface{
    uint public x;
    address public owner;

    constructor(address _owner, uint _x) {
        x = _x;
        owner = _owner;
    }

    function getStateVariable() public view returns(uint){
        return x;
    }
}

contract Parent {

 Child[] public childContracts;

 function createContract(uint seller) public {
        
        Child newContract = new Child(msg.sender, seller);

        
        childContracts.push(newContract);
 }

function getValidChildContractAddresses() public returns(bytes memory addresses){
     Child[] memory validChildContracts;
     
     for(uint i = 0;i <= childContracts.length;i++){
         if(ChildInterface(childContracts[i]).getStateVariable() == 10){
              validChildContracts[i] = address(childContracts[i]);
         }          
     }

     addresses = abi.encode(validChildContracts);
 }
}
