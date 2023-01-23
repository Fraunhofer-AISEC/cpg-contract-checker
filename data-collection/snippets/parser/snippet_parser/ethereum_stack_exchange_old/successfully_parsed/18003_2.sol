contract DonationNew {
  mapping (address => uint) user_amounts;

  function sendDonation(uint n) {
    user_amounts[msg.sender] = user_amounts[msg.sender] + n
  }

  function cancelDonation() {
    user_amounts[msg.sender] = 0
  }
}  
