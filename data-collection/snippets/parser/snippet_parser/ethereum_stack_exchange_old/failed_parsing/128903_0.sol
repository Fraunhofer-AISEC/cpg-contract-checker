contract MintedToken ...
function mint(uint256 amount) isMinter public  {
        _mint(msg.sender, amount);
    }

    function send(address account, uint amount) isMinter public {
        transfer(account, amount); 
        emit Send(minterAddress, amount, account);
    }
