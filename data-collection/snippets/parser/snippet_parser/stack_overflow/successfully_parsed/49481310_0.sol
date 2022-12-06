contract testContract{
   bytes32 public userHashs;

   function userInput(bytes32 _hash)public {
      userHashs = _hash;
   }

}
