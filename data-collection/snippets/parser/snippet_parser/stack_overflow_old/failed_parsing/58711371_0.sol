func    testFunction(id []byte) {
    
    
    tx, err := instance.Action(opt, id)
    if (errors.HasError(err)) {
        return
    }
    callbackValue := subscribeToContract(tx.Hash().Hex())
    logs.Pretty(tx, callbackValue)
    
    
}

func    subscribeToContract(hashToRead string) myStruct {
    query := ethereum.FilterQuery{
        Addresses: []common.Address{address},
    }
    soc := make(chan types.Log)

    sub, err := WssClient.SubscribeFilterLogs(context.Background(), query, soc)
    if err != nil {
        logs.Error(err)
    }

    for {
        select {
        case err := <-sub.Err():
            logs.Info(`SOMETHING ERROR`)
            logs.Error(err)
        case vLog := <-soc:
        logs.Info(`SOMETHING`)
        contractAbi, _ := abi.JSON(strings.NewReader(string(SignABI)))  
        event := myStruct{}
    contractAbi.Unpack(&event, "Result", vLog.Data)
    logs.Info(`New Event from [` + vLog.TxHash.Hex() + `] : ` + event.Message)
        }
    }
}

