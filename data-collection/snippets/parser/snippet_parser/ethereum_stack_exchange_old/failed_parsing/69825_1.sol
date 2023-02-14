contract EncryptedData {
   bytes[] data;
   string public decryptedData[];

   function addData(bytes data_) { 
       data.push(data_);
   }

   function decrypt(bytes key) public {
       for (uint i = 0; i < data.length; i++) {  
           decryptedData.push(decryptDataSomehow(data[i], key));
       }
   }
}
