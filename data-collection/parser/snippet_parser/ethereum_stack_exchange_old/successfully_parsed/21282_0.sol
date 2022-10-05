pragma solidity 0.4;
contract BadIdea {
    address recipient;
    function BadIdea(address _r) { recipient = _r;  }
    function () payable {}
    function kill() { suicide(recipient); }
}
