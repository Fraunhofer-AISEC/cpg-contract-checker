
pragma solidity >=0.6.0 < 0.7.0;

contract testing {
    
    mapping(address => uint256[]) fundsByBidder;
    mapping(uint256 => uint256) newBidToGoods;
     
    function update(uint256 _goodsId) public payable {
        newBidToGoods[_goodsId] = fundsByBidder[msg.sender][_goodsId] + msg.value;
    }
    
    function show(uint256 _goodsId) public view returns(uint256) {
        return newBidToGoods[_goodsId];
    }
}
