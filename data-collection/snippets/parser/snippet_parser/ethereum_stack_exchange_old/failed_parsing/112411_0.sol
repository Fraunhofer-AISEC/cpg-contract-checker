contract Donation{
   address payable owner;
   construct()
   {
     owner = msg.sender;
   }
   function Donate() public payable()
   { }

}
