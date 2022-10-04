contract MyContract {

function showSender() public view returns (address)
{
     return(msg.sender);
 }


 function showSender(address passedAddress) public view returns (address)
  {
     return(passedAddress);
   }

}
