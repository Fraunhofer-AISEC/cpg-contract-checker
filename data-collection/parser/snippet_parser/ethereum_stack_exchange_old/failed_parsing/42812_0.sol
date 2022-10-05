Contract A {
   function whoIsSender() public returns (address){
      return (msg.sender);
   }
}

Contract B is A {
   function withThis() public returns (address){
      return (this.whoIsSender());
   }

   function withoutThis() public returns (address){
      return (whoIsSender());
   }
}
