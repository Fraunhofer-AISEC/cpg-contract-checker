    function hash(MakerOrder memory makerOrder) internal pure returns (bytes32) {
        return keccak256(abi.encode(
            MAKER_ORDER_HASH,
            makerOrder.isOrderAsk,
            makerOrder.signer,
            makerOrder.collection,
            makerOrder.price,
            makerOrder.tokenId,
            makerOrder.amount,
            makerOrder.strategy,
            makerOrder.currency,
            makerOrder.nonce,
            makerOrder.startTime,
            makerOrder.endTime,
            makerOrder.minPercentageToAsk,
            keccak256(makerOrder.params)
            )
        );
    }
