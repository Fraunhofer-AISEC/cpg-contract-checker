data = common.RightPadBytes(common.HexToAddress("0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BA").Bytes(), 32)
    fmt.Println("raw:", hexutil.Encode(data)) 

    hashData := gCrypto.Keccak256Hash(
        []byte(fmt.Sprintf("\x19Ethereum Signed Message:\n%v", len(data))),
        data,
        )

    fmt.Println("Keccak256Hash hashData hex: ", common.BytesToHash(hashData.Bytes())) 

    signature, err := gCrypto.Sign(hashData.Bytes(), privateKey)
    if err != nil {
        log.Fatal(err)
    }

    fmt.Println("signature hex encode: ", hexutil.Encode(signature[:len(signature)-1])) 
    sigPublicKeyECDSA, err := gCrypto.SigToPub(hashData.Bytes(), signature)
    fmt.Println("address: ", gCrypto.PubkeyToAddress(*sigPublicKeyECDSA))
