 
    # "safeTransferFrom" which works for ERC20s which return bool or not
    _response: Bytes[32] = raw_call(
        input_coin,
        concat(
            method_id("transferFrom(address,address,uint256)"),
            convert(msg.sender, bytes32),
            convert(self, bytes32),
            convert(dx, bytes32),
        ),
        max_outsize=32,
    )  # dev: failed transfer
    if len(_response) > 0:
        assert convert(_response, bool)  # dev: failed transfer

