 function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
    allowed[msg.sender][_spender] = _value;
    emit Approval(msg.sender, _spender, _value);
    (bool success, bytes memory data)  = address(_spender).call(abi.encode(
        bytes4(
            bytes32(
                keccak256(
                    abi.encodePacked(
                        "receiveApproval(address,uint256,address,bytes)"
                    )
                )
            )
        ),
        msg.sender, _value, this, _extraData))
    ;
    require(success);
    return true;
}
