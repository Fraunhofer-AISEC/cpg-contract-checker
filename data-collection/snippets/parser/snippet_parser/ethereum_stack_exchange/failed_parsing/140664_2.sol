    address MATIC_TOKEN = 0x0000000000000000000000000000000000001010;

    DonationInfo[] donations;
    
    function _safeTransferMatic(address to, uint256 amount) internal {
      (bool success, ) = to.call{value: amount}("");
      require(success, "MATIC_TRANSFER_FAILED");
    }
        
    function donate(address donor, address token, uint256 amount) {
      donations.push(DonationInfo(donor, token, amount);
    }
    
    function sendDonation(uint256 donateIndex) {
      if (donations[donateIndex].token == MATIC_TOKEN) {
        _safeTransferMatic(charityPartner, donations[donateIndex].amount);
      } else {
IERC20(donations[donateIndex].token).safeTransfer(charityPartner,donations[donateIndex].amount);
      }
    }
