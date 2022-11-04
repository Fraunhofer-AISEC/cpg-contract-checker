function Deposit(uint256 StopLoss) public payable {
        
        
        if (msg.value == 0){
            revert Quantity_zero();
        }
        
        s_Wallets.push(payable(msg.sender));
        
        Dades storage dades = s_Registre[msg.sender];
        dades.Quantity += msg.value;
        dades.Stop = StopLoss;
    } 
