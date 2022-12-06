function decrypt(bytes32 data, int key) public returns (bool) {
    bytes32 decryptedData = data;    
    
    for (int i = 0; i < decryptedData.length; i++) {
        decryptedData[i] = (decryptedData[i] - key) % 256;
    }
    
}
