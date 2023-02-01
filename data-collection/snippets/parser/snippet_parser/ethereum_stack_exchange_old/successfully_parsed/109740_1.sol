
pragma solidity 0.8.0;

contract NFT {
    uint256 public fauouRiteNum;
  
    mapping(address => address) private wallet;
     
    function setNumber(uint256 _fav) public returns(uint256) {
        return fauouRiteNum=_fav;
    }
    
    function marketing(address _add) public {
         wallet[msg.sender] = _add;
    }
    
    function getWallet() public view returns(address) {
        return wallet[msg.sender];
    }
    
}
