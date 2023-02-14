function collectFromTiles(CollectOrder[] memory _orders,
        uint8 _v,
        bytes32 _r,
        bytes32 _s) checkSignature(_v, _r, _s) external override {
        uint arrayLen = _orders.length;
        uint[] memory ids = new uint[](arrayLen);
        uint[] memory amounts = new uint[](arrayLen);
        uint cId;
        uint cAmount;
        
        for (uint i; i < _orders.length; i++) {
            (cAmount, cId) = _handle_collect(_orders[i].x, _orders[i].y, _orders[i].z);
            ids[i] = cId;
            amounts[i] = cAmount;
        }
        
        mint.trustedBatchMint(msg.sender, ids, amounts);
    }
