function getVariable() view returns(uint256) {
    delegateContract.delegatecall(abi.encodeWithSignature(
                "getVariable()"
            )
    )
}
