function _hash(NFTVoucher calldata voucher)
        internal
        view
        returns (bytes32)
    {
        return
            _hashTypedDataV4(
                keccak256(
                    abi.encode(
                        keccak256(
                            "Nft(string URI,uint256 price)"
                        ),
                        keccak256(bytes(voucher.URI)),
                        voucher.price
                    )
                )
            );
    }
