pragma solidity ^0.4.23;

contract A {

    address public owner;
    B public b;

    function A(address _owner) {
        owner = _owner;
        b = B(msg.sender);
    }

    function callB() public view returns(string _greeting)  {
        require(msg.sender == owner);
        return b.onlyForA();
    }

}

contract B {

    A public a;

    function B() {
        a = new A(msg.sender);
    }

    
    function onlyForA() public view returns(string _greeting) {
        require(msg.sender == address(a));
        return "Hello A!";
    }

}
