
        _structHash = keccak256(
            abi.encode(
                _blockhash,
                totalAddresses,
                gasLeft,
                _externalRandomNumber
            )
        );
        _randomNumber  = uint256(_structHash);
        assembly {_randomNumber := add(mod(_randomNumber, _maxNumber),1)}
        winningNumbers[0]=uint8(_randomNumber);

