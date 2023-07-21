    (bool success, bytes memory data) = address(_token).call(
        abi.encodeWithSelector(
            _RECEIVE_WITH_AUTHORIZATION_SELECTOR,
            receiveAuthorization
        )
    );

    if(!success) {
        assembly{
            let revertStringLength := mload(data)
            let revertStringPtr := add(data, 0x20)
            revert(revertStringPtr, revertStringLength)
        }
    }
