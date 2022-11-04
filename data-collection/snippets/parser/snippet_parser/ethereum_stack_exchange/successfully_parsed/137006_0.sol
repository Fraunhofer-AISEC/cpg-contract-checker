function buyTicket() public payable {
        require(msg.value == 2 ether, "not enough ether");
        require(lotteryFunds >= 2 ether, "casino closed for lack of funding");
        tickets++;
    }
