
pragma solidity >=0.4.22 <0.9.0;
contract t1{
    mapping(address => uint256[]) AllSpecialNFT;
    function addNewVal( uint _tokenId) public {
        AllSpecialNFT[msg.sender].push(_tokenId);
    }
    function findSize() public view returns(uint){
        return AllSpecialNFT[msg.sender].length;
    }
    
}
pragma solidity >=0.4.22 <0.9.0;
import './t1.sol';
contract t2 {
    t1 _t1;
    constructor(t1 t1_){
        _t1 = t1_;
    }
    
    function callandAdd(uint _tokenId) public{
        _t1.addNewVal(_tokenId);
    }
    
    
}
