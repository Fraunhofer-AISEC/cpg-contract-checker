
pragma solidity 0.4.25;

contract Another {
    function sendToAnother() public pure returns (uint);
}

contract Test {
    function send(address another) public pure {
        Another(another).sendToAnother();
    }
}
