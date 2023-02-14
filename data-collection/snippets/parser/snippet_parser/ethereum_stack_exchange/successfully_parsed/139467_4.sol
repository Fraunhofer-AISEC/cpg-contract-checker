bytes32 msgHash = keccak256(
            abi.encodePacked(
                param1,
                param2,
                nonce
            )
        );
