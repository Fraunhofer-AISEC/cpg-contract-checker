contract testStamina {
   struct CharacterInfo { 
      uint id;
      uint Stamina;
   }
   
   address ContractOwner = 0xb994fa11552f26A50463f8E2b875A951406c9907;
   CharacterInfo C;

   function setStamina() public {
      C = CharacterInfo(1, 100);
   }
   
      function sendBook(address ContractOwner) public {
      return CharacterInfo(1, 100);
   }
}
