function myFunction() public payable {
  myStruct.number = 1 - address(this).balance;
}
