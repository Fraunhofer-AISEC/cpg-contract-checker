func checkTransactionReceipt(_txHash string) int {
    client, _ := getClient("https://ropsten.infura.io/v3/XXXXXX")
    txHash := common.HexToHash(_txHash)
    tx, err := client.TransactionReceipt(context.Background(), txHash)
    if (Error.HasError(err)) {
        return (-1)
    }
    return (int(tx.Status))
}

func    WaitForBlockCompletation(data EthData, hashToRead string) int {
    soc := make(chan *types.Header)
    sub, err := data.WssClient.SubscribeNewHead(context.Background(), soc)
    if (err != nil) {
        return -1
    }

    for {
        select {
            case err := <-sub.Err():
                _ = err
                return -1
            case header := <-soc:
                logs.Info(header.TxHash.Hex())
                transactionStatus := checkTransactionReceipt(hashToRead)
                if (transactionStatus == 0) {
                    
                    sub.Unsubscribe()
                    return 0
                } else if (transactionStatus == 1) {
                    
                    sub.Unsubscribe()
                    return 1
                }
        }
    }
}
