pragma solidity 0.6.6;

contract System {
    
    Pool pool;
    
    constructor () public {
        pool = new Pool(); 
    }
    
    function payMe() public payable {
        address(pool).transfer(msg.value); 
    }
}

contract Pool {
    
    fallback () external payable { 
        
    }
}
