function verifyVoucher(NFTVoucher calldata voucher, bytes memory signature)
        public
        view
        returns (address)
    {
        require(voucher.price > 0, "Price must be greater than 0");
      
        bytes32 hash = _hash(voucher);
        
        return ECDSA.recover(hash, signature);
    }
