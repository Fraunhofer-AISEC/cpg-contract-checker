contract Donation {
  mapping (address => uint) user_amounts;    


  
  function sendDonation(uint n) {
    user_amounts[msg.sender] = user_amounts[msg.sender] + n
  }
}  
