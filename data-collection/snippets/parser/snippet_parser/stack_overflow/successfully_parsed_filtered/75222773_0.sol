pragma solidity ^0.8;

contract Vehicle {
    function turnRight() virtual external {
        turnSteeringWheel();
    }
}

contract Car is Vehicle {
    
}

contract Motorbike is Vehicle {
    
    
    function turnRight() override external {
        turnHandlebar();
    }
}
