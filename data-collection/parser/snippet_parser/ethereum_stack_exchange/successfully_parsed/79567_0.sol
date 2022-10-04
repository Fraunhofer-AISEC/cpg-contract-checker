pragma solidity 0.6.2;

contract Test {
    uint256 public a;
    constructor (uint256 _a) public {
        a = _a;
    }
}

contract DeployTest {
    function deploy() public {
        new Test{salt: 0x1234}(123);
    }
}
