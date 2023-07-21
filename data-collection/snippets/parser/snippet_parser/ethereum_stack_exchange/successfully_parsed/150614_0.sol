function callExternalContractWithPacked(address _contract, address _testAddr) external {
        bytes memory arg = abi.encode(_testAddr);
        (bool success, bytes memory data) = _contract.call(
            abi.encodeWithSignature("setAddr(address)", arg)
        );
        emit Response(success, data);
}
