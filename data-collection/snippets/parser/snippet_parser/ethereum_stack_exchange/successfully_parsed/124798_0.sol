contract Wallet{
   string value;
   function balance() public view returns(uint){
      return  address(this).balance;
   }
   constructor(string memory _value) payable{
      value =_value;
   }
}
