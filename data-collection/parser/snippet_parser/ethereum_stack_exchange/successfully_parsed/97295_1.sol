
pragma solidity >=0.4.16 <0.9.0;

contract MyContract {
    string bar = "Hello World";

    function foo() public view returns(string memory) {
        return bar;
    }
}
