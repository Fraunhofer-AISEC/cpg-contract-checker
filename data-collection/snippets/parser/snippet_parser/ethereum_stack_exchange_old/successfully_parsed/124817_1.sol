
function buyPromoter()external payable{
        uint PromoterAmount = msg.value * rate;
        require(msg.value <= 15 ether, "You can't have more than 15% of the supply");
        require(token.balanceOf(msg.sender) + PromoterAmount <= 15000000 * 10 ** 18);
        require (getFundPromoterTokenBalance() >= msg.value, "");
        (bool sent, ) = thisContract.call{value: msg.value}("");
        require(sent, "Failed to send Ether"); 
        (bool transferOk) = token.transfer(msg.sender, (PromoterAmount));
        require(transferOk, "Failed to send PROMOTER");
        if(seeIfMemberExist(msg.sender) == false){
            whitelist.push(msg.sender);
            Member[msg.sender].isRegistered = true;
        }
    }


    function sellPromoter(uint amount)external payable{
        require(amount <= token.balanceOf(msg.sender), "you can't sell token you don't own");
        token.approve(thisContract, amount);
        (bool transferOk) = token.transferFrom(msg.sender, thisContract, amount);
        require(transferOk, "Failed to send PROMOTER");
        (bool sent, ) = msg.sender.call{value: amount / rate}("");
        require(sent, "Failed to send Ether");
        if(token.balanceOf(msg.sender) < 1){
            removeMemberOfWhitelist(msg.sender);
        }
    }
