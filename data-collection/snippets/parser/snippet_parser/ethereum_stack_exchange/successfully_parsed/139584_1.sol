    function sendEthViaUsd(uint256 _amount) public payable {
       uint256 amount = msg.value;
       uint256 requiredAmount = usdWeiConverter(_amount);

       require(
         amount >= requiredAmount,
         "User needs to send higher ETH value."
       );
       payable(msg.sender).transfer(amount - requiredAmount);
    }
