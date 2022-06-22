pragma solidity ^0.4.16;

    
    contract Greetable {
        function Greetable() public {}
        function greet() constant public returns (bytes32);
    }

    
    contract GreeterContainer is Greetable {

    
    Greetable greeter;

    function GreeterContainer(address greeter_address) public {
        greeter = Greetable(greeter_address);
    }

    
    
    function setGreeter(address _greeter_address) public {
        greeter = Greetable(_greeter_address);
    }

    
    function greet() constant public returns (bytes32) {
        return greeter.greet();
    }
}
