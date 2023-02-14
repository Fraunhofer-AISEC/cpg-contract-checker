
pragma solidity ^0.4.25;

import "./Another.sol";

contract Test {
    function send(address another) public  {
        Another(another).sendToAnother();
    }
}
