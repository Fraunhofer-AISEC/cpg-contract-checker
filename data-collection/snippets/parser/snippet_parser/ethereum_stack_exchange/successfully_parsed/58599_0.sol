function fundContract() public payable {
        require (msg.sender == users[msg.sender].addr);
        users[msg.sender].balance += msg.value;
        contractBalance+=msg.value;

    }


function withdraw (uint amount) public onlyUser() payable{

        require (msg.sender == users[msg.sender].addr);
        require (amount > 0);
        require (amount <= users[msg.sender].balance);

        msg.sender.transfer(amount);

        users[msg.sender].balance -= amount;
        contractBalance-= amount;
    }
