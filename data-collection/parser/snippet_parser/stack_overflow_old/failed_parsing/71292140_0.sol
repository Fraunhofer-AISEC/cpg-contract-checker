
pragma solidity ^0.8.7;

abstract contract Animal {
    uint8 head = 1;
    function braking() public virtual pure returns(string memory);
}

interface get {
    function getHeadNumber() external returns(uint8);
}

contract Dog is Animal, get{
    function braking() public override pure returns(string memory) {
        return "Woof!!";
    }

    function getHeadNumber() public override view returns(uint8) {
        return head;
    }
}

contract Cat is Animal, get {        < < < error here !!!!

    function braking() public override pure returns(string memory) {
        return "Meow!!";
    }
    
    function getHeadnumber() public override view returns(uint8) {
        return head;
    }
}
