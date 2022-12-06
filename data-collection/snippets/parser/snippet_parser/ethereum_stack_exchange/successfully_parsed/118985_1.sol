
pragma solidity >=0.7.0 <0.9.0;

contract Idk {
    Thing[] deployedThings;

    function createSomething(address  _name) public returns (address) {
        Thing newThing= new Thing(_name, address(this));
        deployedThings.push(newThing);
        return address(newThing);
    }

    function seeThings() public view returns(Thing[] memory){
        return deployedThings;
    }

    

    receive() payable external {}     
 }


contract Thing {

     address public name;
     address public parent;

    constructor(address _name, address _parent) {
        name= _name;
        parent = _parent; 
    }

    function sendEth() public payable {
        require(msg.value==1 ether, "Value has to be 1 ether");

        (bool success1, ) = name.call{value: 0.2 ether}("");
        require(success1, "First transfer failed");
        
        (bool success2, ) = parent.call{value: 0.8 ether}("");
        require(success2, "First transfer failed");
    }
}
