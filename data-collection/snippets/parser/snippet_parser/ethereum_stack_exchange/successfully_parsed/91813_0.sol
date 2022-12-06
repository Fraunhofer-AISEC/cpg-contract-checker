pragma solidity 0.6.12;

contract A {
    uint256 public x;

    function func(uint256 _x) public {
        require(_x < 42);
        x = _x;
    }
}

contract B {
    uint256 public successCount;

    function run(address a, uint256 x) public {
        bytes memory input = abi.encodeWithSelector(bytes4(keccak256("func(uint256)")), x);
        (bool success, bytes memory output) = a.call(input);
        if (success)
            successCount++;
    }
}
