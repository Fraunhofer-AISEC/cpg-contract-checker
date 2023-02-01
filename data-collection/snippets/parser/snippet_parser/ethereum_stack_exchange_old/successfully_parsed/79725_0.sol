    function doKeccak(bytes memory _data) public pure returns (bytes32) {
        return keccak256(_data);
    }

    function packed(
        address _from,
        address _to,
        uint256 _value,
        bytes memory _data,
        uint256 _nonce,
        uint256 _gasPrice,
        uint256 _gasLimit
    ) public pure returns (bytes memory) {
        return
            abi.encodePacked(
                bytes1(0x19),
                bytes1(0),
                _from,
                _to,
                _value,
                _data,
                _nonce,
                _gasPrice,
                _gasLimit
            );
    }

   function doKeccakPacked(
        address _from,
        address _to,
        uint256 _value,
        bytes memory _data,
        uint256 _nonce,
        uint256 _gasPrice,
        uint256 _gasLimit
    ) public pure returns (bytes32) {
        return
            keccak256(
                abi.encodePacked(
                    bytes1(0x19),
                    bytes1(0),
                    _from,
                    _to,
                    _value,
                    _data,
                    _nonce,
                    _gasPrice,
                    _gasLimit
                )
            );
    }
