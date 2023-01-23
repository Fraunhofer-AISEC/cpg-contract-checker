        ...
        ...

        uint256 _signaturesRequired = multiSigWallet.signaturesRequired();
        bytes[][] memory _signatures = new bytes[][](2);
        for (uint256 i = 0; i < _receivers.length; i++) {
            for (uint256 j = 0; j < _signaturesRequired; j++) {
                _signatures[i][j] = _getSignature(
                    signersPrivKeys[j],
                    _hashes[i]
                ); 
            }
        }
        vm.deal(address(multiSigWallet), 1 ether);
        vm.prank(signers[0]);
        multiSigWallet.executeBatch(_receivers, _values, _data, _signatures);

        for (uint8 i = 0; i < _receivers.length; i++) {
            assertEq(_receivers[i].balance, 0.1 ether);
        }
    }
