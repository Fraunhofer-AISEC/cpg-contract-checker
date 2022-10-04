package blockchain

import (
    "encoding/json"
    "fmt"
    "io/ioutil"

    "github.com/.../scanner/env"
    "github.com/hashgraph/hedera-sdk-go/v2"
)

type contract struct {
    Abi string `json:"abi"`
    Bin string `json:"bin"`
}

type contracts struct {
    Contracts map[string]contract `json:"contracts"`
    Version   string              `json:"version"`
}

func DeployContract() {
    var client *hedera.Client
    var err error

    
    client, err = hedera.ClientForName(env.GetEnv["HEDERA_NETWORK"])
    if err != nil {
        println(err.Error(), ": error creating client")
        return
    }

    
    operatorAccountID, err := hedera.AccountIDFromString(env.GetEnv["OPERATOR_ID"])
    if err != nil {
        println(err.Error(), ": error converting string to AccountID")
        return
    }

    
    operatorKey, err := hedera.PrivateKeyFromString(env.GetEnv["OPERATOR_KEY"])
    if err != nil {
        println(err.Error(), ": error converting string to PrivateKey")
        return
    }

    
    client.SetOperator(operatorAccountID, operatorKey)

    
    defer func() {
        err = client.Close()
        if err != nil {
            println(err.Error(), ": error closing client")
            return
        }
    }()

    
    rawSmartContract, err := ioutil.ReadFile("./contract/contract.json")
    if err != nil {
        println(err.Error(), ": error reading contract.json")
        return
    }

    
    var smartContract contracts = contracts{}

    
    err = json.Unmarshal([]byte(rawSmartContract), &smartContract)
    if err != nil {
        println(err.Error(), ": error unmarshaling")
        return
    }

    
    smartContractByteCode := smartContract.Contracts["contract.sol:ScanInput"].Bin

    
    fmt.Printf("Contract bytecode size: %v bytes\n", len(smartContractByteCode))

    
    newFileResponse, err := hedera.NewFileCreateTransaction().
        
        
        
        SetKeys(client.GetOperatorPublicKey()).
        
        SetContents([]byte("Initializing file.")).
        SetMemo("go file append test").
        
        SetMaxTransactionFee(hedera.NewHbar(2)).
        Execute(client)
    if err != nil {
        println(err.Error(), ": error creating file")
        return
    }

    
    receipt, err := newFileResponse.GetReceipt(client)
    if err != nil {
        println(err.Error(), ": error retrieving file creation receipt")
        return
    }

    
    fileID := *receipt.FileID

    
    fileResponse, err := hedera.NewFileAppendTransaction().
        
        SetNodeAccountIDs([]hedera.AccountID{newFileResponse.NodeID}).
        
        SetFileID(fileID).
        
        SetContents([]byte(smartContractByteCode)).
        
        SetMaxTransactionFee(hedera.NewHbar(5)).
        Execute(client)
    if err != nil {
        println(err.Error(), ": error executing file append transaction")
        return
    }

    
    receipt, err = fileResponse.GetReceipt(client)
    if err != nil {
        println(err.Error(), ": error retrieving file append transaction receipt")
        return
    }

    
    println(receipt.Status.String())
    info, err := hedera.NewFileInfoQuery().
        
        SetNodeAccountIDs([]hedera.AccountID{fileResponse.NodeID}).
        
        SetFileID(fileID).
        Execute(client)

    if err != nil {
        println(err.Error(), ": error executing file info query")
        return
    }

    println("File size according to `FileInfoQuery`:", info.Size)
    println("File memo according to `FileInfoQuery`:", info.FileMemo)

    
    byteCodeTransactionReceipt, err := newFileResponse.GetReceipt(client)
    if err != nil {
        println(err.Error(), ": error getting file create transaction receipt")
        return
    }

    
    byteCodeFileID := *byteCodeTransactionReceipt.FileID

    fmt.Printf("contract bytecode file: %v\n", byteCodeFileID)

    
    contractTransactionID, err := hedera.NewContractCreateTransaction().
        
        
        SetGas(100000).
        
        SetBytecodeFileID(byteCodeFileID).
        
        
        SetAdminKey(client.GetOperatorPublicKey()).
        Execute(client)

    if err != nil {
        println(err.Error(), ": error creating contract")
        return
    }

    
    contractRecord, err := contractTransactionID.GetRecord(client)
    if err != nil {
        println(err.Error(), ": error retrieving contract creation record")
        return
    }

    
    contractCreateResult, err := contractRecord.GetContractCreateResult()
    if err != nil {
        println(err.Error(), ": error retrieving contract creation result")
        return
    }

    
    newContractID := *contractRecord.Receipt.ContractID

    fmt.Printf("Contract create gas used: %v\n", contractCreateResult.GasUsed)
    fmt.Printf("Contract create transaction fee: %v\n", contractRecord.TransactionFee)
    fmt.Printf("contract: %v\n", newContractID)

}
