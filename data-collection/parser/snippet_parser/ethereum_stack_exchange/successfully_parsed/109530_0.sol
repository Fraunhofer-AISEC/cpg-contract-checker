pragma solidity ^0.8.0;

contract MyContract {
  address public constant OTHER_CONTRACT = 0x8016619281F888d011c84d2E2a5348d9417c775B;

  event Response(bool success, bytes data);

    function testCall() public returns (bytes memory) {
        (bool success,  bytes memory data) = OTHER_CONTRACT.call{gas: 50000}(abi.encodeWithSignature("greet()"));

        emit Response(success, data);

        return data;
    }
}
