contract EncryptedData {
   bytes data;
   string public decryptedData;

   constructor(bytes data_) public {
      data = data_;
   }

   function decrypt(bytes key) public {
      decryptedData = decryptDataSomehow(data, key);
   }
}
