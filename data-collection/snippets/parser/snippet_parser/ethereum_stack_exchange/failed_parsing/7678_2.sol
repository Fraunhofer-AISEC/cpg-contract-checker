contract PubKey {
     bytes32 pubKeyHalf1, pubKeyHalf2;

     function PubKey(bytes32 initKeyHalf1, bytes32 initKeyHalf2) {
         pubKeyHalf1 = initKeyHalf1;
         pubKeyHalf2 = initKeyHalf2;
     }

     function getPubKeyHalf1() constant returns (bytes32) {
        return pubKeyHalf1;
     }

     function getPubKeyHalf2() constant returns (bytes32) {
        return pubKeyHalf2;
     }
}
