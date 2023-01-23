pragma solidity ^0.5.0;

import "./Another.sol";

contract Test {
    function send(address another) public  {
        Another(another).sendToAnother();
    }
}
