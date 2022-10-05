pragma solidity >=0.7.0 <0.9.0;

contract test1 {
    
    

    address[] public SWaddresses;
    mapping(address => smartWallet) public smartWallets;
    
    struct smartWallet {
        uint index;    
        mapping(address => uint) walletTokens;
    }
    
    function addSmartWallet(address newSWaddress, address[] memory _tokens, uint[] memory _tokenamounts) public {
        
        
        for (uint i = 0; i < _tokenamounts.length; i++) {
            smartWallets[newSWaddress].walletTokens[_tokens[i]] = _tokenamounts[i];
        }
    
        
        SWaddresses.push(newSWaddress);
        smartWallets[newSWaddress].index = SWaddresses.length - 1;
    }
    
    function addOrUpdateWalletTokens(address SWaddress, address[] memory _tokens, uint[] memory _tokenamounts) public {

        
        for (uint i = 0; i < _tokenamounts.length; i++) {
            smartWallets[SWaddress].walletTokens[_tokens[i]] = _tokenamounts[i];
        }
    }
    
    function removeSmartWallet(address SWaddress) public {
        
        
        smartWallets[SWaddresses[SWaddresses.length - 1]].index = smartWallets[SWaddress].index;
        SWaddresses[smartWallets[SWaddress].index] = SWaddresses[SWaddresses.length - 1];
        SWaddresses.pop();
        delete(smartWallets[SWaddress]);
    }
    
    
    function retrieveSmartWalletTokensandAmounts(address SWaddress, address tokenAddress) public view returns(uint) {
        return smartWallets[SWaddress].walletTokens[tokenAddress];
    }

}
