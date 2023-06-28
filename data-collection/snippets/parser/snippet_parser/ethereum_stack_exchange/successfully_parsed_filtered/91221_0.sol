contract MyToken is ERC20 {
    constructor ()
        ERC20("StableToken", "STBL")
        public
    {
        
        
        
        
        
        _mint(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 1000000);
        _mint(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2,1000000);
        
    }
}

contract testProtocol {

function checkStableTokenBalance() public returns(uint256) {
    STBLInterface stbl = STBLInterface(stblContract);
    return stbl.balanceOf(msg.sender);  
}


function transferStableToken(address _recipient, uint256 _amount) public payable returns(bool) {
    STBLInterface stbl = STBLInterface(stblContract);
    return stbl.transfer(_recipient, _amount);
}

function approveStableToken(address _spender, uint256 _amount) public returns (bool){
    STBLInterface stbl = STBLInterface(stblContract);
    return stbl.approve(_spender, _amount);
    
}


function transferFromStableToken(address _sender, address _recipient, uint256 _amount) public payable returns(bool) {
    STBLInterface stbl = STBLInterface(stblContract);
    return stbl.transferFrom(_sender, _recipient, _amount);
}

}

