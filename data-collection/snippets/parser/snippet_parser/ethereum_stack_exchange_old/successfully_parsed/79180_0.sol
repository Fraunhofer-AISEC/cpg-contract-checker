pragma solidity ^0.5.2;

contract PGPAccounts {

  
    struct PGPAccount {
        bytes pubkey;            
        bool isLinked;          
    }

    mapping (address => PGPAccount) accounts;

    
    
    function hasAccount(address _address) public returns(bool) {
        return accounts[_address].isLinked;
    }

    
    
    function newAccount(bytes calldata _pubkey) external {
        require(hasAccount(msg.sender) == false);   

        
        PGPAccount storage newPGPAccount = accounts[msg.sender];
        newPGPAccount.pubkey = _pubkey; 
        newPGPAccount.isLinked = true;

        
        PGPMultisig newPGPMultisig = new PGPMultisig({
              _owner: msg.sender,
              _verifier: address(this)
            });
    }


    function getPubKey(address payable _accountHolder) public returns(bytes memory pubKey) {
        require(accounts[_accountHolder].isLinked == true);   

        return accounts[_accountHolder].pubkey;
    }

    function () external payable {} 
}





contract PGPMultisig {

    address owner;                              
    address PGPverifier;                        

    constructor(address _owner, address _verifier) public {
    owner = _owner;
    
    
    PGPverifier = address(uint160(address(_verifier))); 
    }

    
    
    
    function checkTXValid(
        bytes calldata _PGPsig,
        bytes calldata _desiredTXHash,
        address _contractAddress,       
        address payable _to,            
        uint256 _value                  
        ) external {

        require(msg.sender == owner);   

        
        require(PGPverifier.hasAccount(msg.sender) == true); 

        

        
        if (_contractAddress == 0x0000000000000000000000000000000000000000) {  

            
        }

        
        else {
             
        }

    }

    function () external payable {} 

}
