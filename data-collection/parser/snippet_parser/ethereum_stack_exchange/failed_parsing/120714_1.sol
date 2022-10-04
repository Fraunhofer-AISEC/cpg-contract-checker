        string memory errMsg = string(
            abi.encodePacked(
                Strings.toString(amount0),
                ",",
                Strings.toString(amount1),
                ",",
                Strings.toString(uint256(uint160(pairAddress)))
            )
        );
        require(1 == 0, errMsg);
