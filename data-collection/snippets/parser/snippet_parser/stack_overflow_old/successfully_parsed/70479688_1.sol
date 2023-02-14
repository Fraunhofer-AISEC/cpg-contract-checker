     function fund() public payable {
         uint256 minimumUSD = 30 * 10 ** 18;
         require(getConversionRate(msg.value) >= minimumUSD, "You need to spend more ETH");
         addressToAmountFunded[msg.sender] += msg.value;
     }
