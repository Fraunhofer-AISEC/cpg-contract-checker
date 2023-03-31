function verify(
        address _customer,
        address _to,
        uint256 _value,
        bytes32 _key,
        bytes memory _signature,
        uint256 nonce
    ) public alreadySubmitted returns (address) {
        require(submitted[_customer]);
        _value = _value * 1 ether;
        bytes32 signature = getSignature(_to, _value, _key, nonce);
        address recovered = recoverSigner(signature, _signature);
        if (recovered == _customer) {
            verified[msg.sender] = true;
            emit Verified(msg.sender, "is now verified. Congrats!!");
        }

        return recovered;
    }
