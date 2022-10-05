pragma solidity 0.5.16;

contract GasTesst {
    bytes32[] public test;

    function addToArray(bytes32 _t) public {
        test.push(_t);
    }

    function read() public {
        for (uint256 i = 0; i < test.length; i++) {
            bytes32 t = test[i];
        }
    }
}
