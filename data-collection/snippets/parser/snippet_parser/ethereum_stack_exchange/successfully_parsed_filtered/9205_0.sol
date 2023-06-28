pragma solidity ^0.4.2;

contract MyContract {
    address public oracle;
    uint public lastAliveTime;

    modifier throwUnless(bool condition) {
        if (!condition) { throw; }
        _;
    }

    function MyContract() {
        oracle = msg.sender;
        showProofOfLife();
    }

    function showProofOfLife() throwUnless(msg.sender == oracle) {
        lastAliveTime = now;
    }

    function doSomethingUseful() throwUnless((now - lastAliveTime) < 15 minutes) {
        
    }
}
