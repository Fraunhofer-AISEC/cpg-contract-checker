library PersonLibrary {
    
    function createFullName(string memory first, string memory last, string storage full)  public {
         string memory fullName = string(abi.encodePacked( first, " ",  last));
         full = fullName;
    }
}
