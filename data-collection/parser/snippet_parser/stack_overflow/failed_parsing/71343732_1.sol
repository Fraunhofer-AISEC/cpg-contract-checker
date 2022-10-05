def registerStation1():
    print("\n***********************************************************************************************************")
    print("Test registerStation Method of Smart Contract")
    print("***********************************************************************************************************\n")
    # call transactional method
    #function registerStation(address stationAddress, address ownerAddress, string memory pwd, string memory stationDetails, string memory location, string memory availability,uint priceRate, uint rating, uint ratedby)

    ownerAddress =  "0x9E498002E0e6f7b8208941cF17611de82b64Fec1" #MetaMask Third Account
    ownerPrivateKey = ""
    contract_func1 = contract.functions.speak(ownerAddress, "0xf886D7306336007136D87398B1Ceb4AE194949D2")

    try:
        transaction = contract_func1.buildTransaction()
        nonce = w3.eth.getTransactionCount(ownerAddress)
        transaction['nonce'] = nonce
        #print(transaction)
        signed_Transaction = w3.eth.account.signTransaction(transaction, ownerPrivateKey);
        txn_hash = w3.eth.sendRawTransaction(signed_Transaction.rawTransaction);
        print('txn_hash={} waiting for receipt..'.format(txn_hash.hex()))

        tx_receipt = w3.eth.waitForTransactionReceipt(txn_hash, timeout=240)

        greeting_Event = contract.events.errorLog()
        result = greeting_Event.processReceipt(tx_receipt) # Modification
        print(result[0]['args'])
        print("Receipt accepted. gasUsed={gasUsed} blockNumber={blockNumber}". format(**tx_receipt))

    except Exception as err:
        print("Exception Occured: ",err)
        #raise Exception(err)
    print("\n***********************************************************************************************************")
    print("Test registerStation Method End")
    print("***********************************************************************************************************\n")


registerStation1()
