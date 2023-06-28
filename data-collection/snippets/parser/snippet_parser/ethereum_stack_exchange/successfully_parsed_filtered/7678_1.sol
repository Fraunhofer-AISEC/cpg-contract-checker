contract PubKey {
    uint8[] pubKeyBytes;

    function PubKey(uint8[] initKey) {
       for(uint i = 0; i < initKey.length; i++) {
          pubKeyBytes.push(initKey[i]);
       }
}

function getPubKeyByte(uint i) constant returns (uint) {
    return pubKeyBytes[i];
}
}