pragma solidity 0.8.0;




contract NFT {
    uint256 public fauouRiteNum;
    
    mapping(address => address) private wallet;
    
    
     
    function setNumber(uint256 _fav) public returns(uint256){
        return fauouRiteNum=_fav;
    }
    
    function marketing(address _add) public returns(address){
         wallet[msg.sender] = _add;
    }
    
    function getWallet(uint256 _wallet) public view returns(uint256){
    return wallet=_wallet;
    }
}
    
    
    
