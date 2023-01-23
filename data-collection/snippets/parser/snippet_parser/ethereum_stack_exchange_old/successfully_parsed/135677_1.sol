function preorderItem(
        uint256 _idItem,
        uint256 _nonce,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) external view returns (address, address) {
        bytes32 message = keccak256(
            abi.encodePacked(_idItem, address(this), _nonce)
        );
       
        return (ecrecover(message, _v, _r, _s), owner());
    }
