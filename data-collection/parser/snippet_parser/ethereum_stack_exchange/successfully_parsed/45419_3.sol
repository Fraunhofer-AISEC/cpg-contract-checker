pragma solidity ^0.4.17;

import "zeppelin-solidity/contracts/math/SafeMath.sol";

contract EmojiCoin {

    mapping(uint256 => address) public tokenOwner;
    mapping(uint256 => uint256) public emojiIndexToPrice;
    uint256 public ownerCut  = 5;


    function EmojiCoin() public {

        
        tokenOwner[0] = msg.sender;
        emojiIndexToPrice[0] = 1 ether;

    }

    
    function _transfer(address oldOwner, address newOwner, uint256 _tokenId) internal {
        require(tokenOwner[_tokenId] == oldOwner);
        tokenOwner[_tokenId] = newOwner;
    }

    function purchase(uint256 _tokenId) public payable {
        address oldOwner = tokenOwner[_tokenId];
        uint256 sellingPrice = emojiIndexToPrice[_tokenId];
        address newOwner = msg.sender;

        require(oldOwner != newOwner);

        require(newOwner != address(0));

        require(msg.value >= sellingPrice);

        uint256 percentage = SafeMath.sub(100, ownerCut);
        uint256 payment = uint256(SafeMath.div(SafeMath.mul(sellingPrice, percentage), 100));
        uint256 purchaseExcess = SafeMath.sub(msg.value, sellingPrice);

        emojiIndexToPrice[_tokenId] = SafeMath.div(SafeMath.mul(sellingPrice, 150), percentage);

        _transfer(oldOwner, newOwner, _tokenId);

        if (oldOwner != address(this)) {
           oldOwner.transfer(payment);
        }

        msg.sender.transfer(purchaseExcess);
    }


}
