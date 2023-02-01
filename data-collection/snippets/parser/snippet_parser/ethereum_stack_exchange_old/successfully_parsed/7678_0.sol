contract PubKey {
         bytes32 pubKey;

         function PubKey(bytes32 initKey) {
             pubKey = initKey;
         }

         function getPubKey() constant returns (bytes32) {

            return pubKey;

         }
    }
