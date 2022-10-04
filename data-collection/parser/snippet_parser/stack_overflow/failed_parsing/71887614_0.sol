    address public deployer; 
    
    constructor() ERC20('tokenA', 'TA') { 
        _mint(msg.sender, 1000000000000 * 10 ** 10); 
        deployer = msg.sender;  
    }

    

    function burn (uint amount) external {  
        _burn(msg.sender, amount);
    }
}
