    private byte[] GetSignature(string privateKey, string textToHash)
    {
        var abiEncode = new ABIEncode();
        var abiValue = new ABIValue("address", textToHash);
        var encodedValue = abiEncode.GetABIEncodedPacked(abiValue);

        var hashing = new Sha3Keccack();
        byte[] msgHash = hashing.CalculateHash(encodedValue);

        var key = new EthECKey(privateKey);

        var signer = new EthereumMessageSigner();

        var signature = signer.SignAndCalculateV(msgHash, key);

        var signatureByteArray = signature.To64ByteArray();

        return signatureByteArray;
    }
