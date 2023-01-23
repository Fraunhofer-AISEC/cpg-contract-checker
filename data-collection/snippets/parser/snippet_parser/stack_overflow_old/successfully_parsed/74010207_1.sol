
pragma solidity ^0.8.15;

error InvalidAmount (uint256 sent, uint256 minRequired);

contract C {
    uint32 public num;
    address public sender;

    function setVars(uint32 _num) public {
        if (_num < 5) {
            revert InvalidAmount({
                sent: _num,
                minRequired: 5
            });
        }
        num = _num;
    }
}
