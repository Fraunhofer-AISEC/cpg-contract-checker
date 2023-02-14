pragma solidity ^0.4.8;

contract Child {
    address public owner;

    function Child() public {
        owner = msg.sender;
    }
}

contract Parent {
    address owner;

    event NewChildCreated(address childAddress, address creator);

    function Parent() public {
        owner = msg.sender;
    }

    function createChild() public {
        Child child = new Child();
        NewChildCreated(address(child), child.owner());
    }
}
