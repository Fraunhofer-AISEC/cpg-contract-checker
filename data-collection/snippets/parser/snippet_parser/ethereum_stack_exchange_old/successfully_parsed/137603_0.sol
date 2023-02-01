abstract contract Test is ERC165 {
   
   function great1() public {

   }

   function great2() public {

   }

   function supportsInterface(bytes4 interfaceId) public view override returns(bool) {
     return interfaceId == type(Test).interfaceId || super.supportsInterface(interfaceId);
   }

}

