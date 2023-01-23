    address thirdParty;
    bool signedByA;
    bool signedByB;
    byte[] docData;

  function signDoc() public {
    if(sender == "Aaddress") {
       signedByA = true;
    }
    if(sender == "Baddress") {
       signedByB = true;
    }

    if(signedByA && signedByB) {
      thirdParty.sendTransaction(docData);
    }       
}
