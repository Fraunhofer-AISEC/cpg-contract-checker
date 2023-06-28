pragma solidity 0.8.17;

contract Main {
    event Response(bool successful, bytes data);

    function testCallSetInt(uint v) external {
        address helloContract = 0x809d550fca64d94Bd9F66E60752A544199cfAC3D;
        (bool success, bytes memory data) = helloContract.call(
            abi.encodeWithSignature("set(uint256)", v)
        );
        require(success, "call failed");
        emit Response(success, data);
    }
}
