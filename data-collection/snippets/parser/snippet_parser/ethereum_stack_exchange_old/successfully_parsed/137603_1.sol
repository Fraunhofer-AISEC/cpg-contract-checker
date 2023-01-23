function supportsInterface(bytes4 interfaceId) public view override returns(bool) {
     return interfaceId == this.great1.selector ^ this.great2.selector || super.supportsInterface(interfaceId);
   }
