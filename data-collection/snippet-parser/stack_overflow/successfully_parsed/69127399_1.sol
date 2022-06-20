pragma solidity 0.5.16;

contract MyContract {
    function foo() external {
        address externalContract = address(0x123);
        (bool success, bytes memory returnedData) = externalContract.call.value(0)(
            abi.encodeWithSignature("initialize()")
        );
    }
}
