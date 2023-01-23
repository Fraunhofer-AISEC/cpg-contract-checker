bytes32 swapHash = keccak256(
    abi.encode(
        SWAP_TYPEHASH,
        swap.scriptId,
        swap.tokenFrom,
        swap.tokenTo,
        swap.amount,
        swap.user,
        swap.executor,
        swap.chainId,
        hashBalance(swap.balance),
        hashFrequency(swap.frequency),
        hashPrice(swap.price),
        hashRepetitions(swap.repetitions),
        hashParent(swap.parent)
    )
);
