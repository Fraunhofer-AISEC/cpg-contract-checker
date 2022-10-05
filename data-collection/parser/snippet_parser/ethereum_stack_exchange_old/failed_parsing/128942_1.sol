interface IWallet {
    struct Operation {
        uint256 nonce;
        IWallet.ActionData[] actions;
    }

    struct ActionData {
        uint256 ethValue;
        address contractAddress;
        bytes encodedFunction;
    }
    ...
}
