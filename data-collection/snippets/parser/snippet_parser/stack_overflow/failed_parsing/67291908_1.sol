contract Bank {
    
    
    mapping (address user => uint money) balance;

    constructor(){}

    function withdraw(uint memory money) public {
        
        require(money != 0, "Can't withdraw 0 eth");


        
        
        
        

        
        if (balance[msg.sender].money >= money) {
            
            address(msg.sender).transfer(money);

            
            balance[msg.sender].money -= money;
        }

    
    }

    ...
}
