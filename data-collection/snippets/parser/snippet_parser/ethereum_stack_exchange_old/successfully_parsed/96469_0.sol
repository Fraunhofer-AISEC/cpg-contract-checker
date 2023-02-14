pragma solidity 0.5.1;

contract AllWalletsContract{
    
    struct AllWallets{
        address wallet;
        uint amount;
    }
    
    AllWallets[] allWallets;
    
    function add(address _wallet, uint _amount) public {
        allWallets.push( AllWallets( _wallet, _amount) );
    }   
    
    function getBiggestWallet() public view returns (address) {
        
    }       
  
}
