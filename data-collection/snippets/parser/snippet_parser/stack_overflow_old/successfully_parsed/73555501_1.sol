   function enter() payable public {
        require(ETHtoUSD(msg.value) >= usdfee, "Not enough ETH!");
        require(currentstate == lotteryState.open, "Lottery isn't open yet!");
        players.push(payable(msg.sender));
     }
