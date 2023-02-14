client, err := ethclient.Dial("http://localhost:8545")
if err != nil {
    errorhandler.HandleErr(err, 1)
}

privateKey, err := crypto.HexToECDSA(hexKey)

if err != nil {
    errorhandler.HandleErr(err, 2)
}

publicKey := privateKey.Public()

publicKeyEcdsa, ok := publicKey.(*ecdsa.PublicKey)

if !ok {
    errorhandler.HandleErr(errors.New("pub key not of type ecdsa.PublicKey"), 3)
}

fromAddr := crypto.PubkeyToAddress(*publicKeyEcdsa)
nonce, err := client.PendingNonceAt(context.Background(), fromAddr)

if err != nil {
    errorhandler.HandleErr(err, 4)
}

gasPrice, err := client.SuggestGasPrice(context.Background())

if err != nil {
    errorhandler.HandleErr(err, 5)
}

auth := bind.NewKeyedTransactor(privateKey)
auth.Nonce = big.NewInt(int64(nonce))
auth.GasLimit = uint64(4700000)
auth.GasPrice = gasPrice

address, tx, instance, err := eddns.DeployEddns(auth, client)

if err != nil {
    errorhandler.HandleErr(err, 6)
}

_ = instance
return address.Hex(), tx.Hash(), auth
