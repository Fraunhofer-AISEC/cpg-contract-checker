   contract vaultCoin {
        uint amount; 
        address user;
        uint amountDeposit;
    
        function vaultCoin() public {
            dev = msg.sender;                    
        }
    
        address public dev;                          
        address[] public users;                   
        uint[] public totalDeposited;                
    
        mapping(address => uint) balances;
        
        function sendToken() public payable {
            balances[msg.sender] = amount;
            require(msg.value > 0.001 ether); 
            
            user = msg.sender;               
            amountDeposit = msg.value;      
            
            users.push(user);                     
            totalDeposited.push(amountDeposit);     
        }
    
        function getUsers() public view returns (address[]) {    
            return users;
        }
    
        function getAmount() public view returns (uint[]) {
            return totalDeposited;
        }
    
        function retireMyCoins() public payable {
            require(msg.sender == user);
            require(msg.value == amountDeposit);
            balances[msg.sender] = 0; 
            msg.sender.transfer(balances[msg.sender]); 
        }
    }
