
pragma solidity 0.4.25;

contract Another {
    function sendToAnother() public;
}

contract Test {
    function send(address another) public {
        Another(another).sendToAnother();
    }
}
