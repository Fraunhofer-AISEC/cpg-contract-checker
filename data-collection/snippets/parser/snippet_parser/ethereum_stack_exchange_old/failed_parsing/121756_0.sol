    function _mint() public payable{
            require(msg.value == 1 ether , "Send more ethers: 1 ether is required");
            require(balanceOf(msg.sender)==0, "You can not have more than 1 Land");
           .........
        }
