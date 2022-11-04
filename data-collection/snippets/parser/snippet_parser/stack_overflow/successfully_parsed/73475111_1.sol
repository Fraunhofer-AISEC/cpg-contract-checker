

import "@openzeppelin/contracts/access/Ownable.sol";
import "./LotteryToken.sol";
import "./LotteryInfo.sol";

pragma solidity ^0.8.4;

contract Lottery is Ownable{

    LotteryInfo private lotteryInfo;
    LotteryToken private lotteryToken;

    event BidCorrect(address bidder, uint tokenId, uint defaultBid);

    constructor(){

    }


    function initLotteryTokenContract(address _lotteryTokenContract)public onlyOwner{
        lotteryToken = LotteryToken(_lotteryTokenContract);
        lotteryToken.increaseAllowance(address(this), lotteryToken.balanceOf(lotteryToken.owner()));
    }



    function initLotteryInfoContract(address _lotteryInfoContract)public onlyOwner{
        lotteryInfo = LotteryInfo(_lotteryInfoContract);
    }

    

    function setItemToWin(
        string memory _name,
        uint _defaultBid,
        uint _endingTimeLottery
        )public onlyOwner{
            require(_endingTimeLottery > block.timestamp, "Cannot set a date in the Past!");
            lotteryInfo.setItemToWin(_name, _defaultBid, _endingTimeLottery);
    }



    function buyTokens(uint _quantity)external payable{
        uint singleTokenPrice = 0.02 ether;
        uint finalPrice = singleTokenPrice * _quantity;
        require(msg.sender != owner() && msg.sender != lotteryToken.owner(), "Admin Cannot Buy Tokens!");
        require(msg.value == finalPrice, "Please set the right price!");
        payable(owner()).transfer(msg.value);
        address lotterytokenOwner = lotteryToken.owner();
        lotteryToken.transferFrom(lotterytokenOwner, msg.sender, _quantity);
    }



    function placeABid(uint _tokenIds)external{
        require(block.timestamp < lotteryInfo.getEndingTimeLottery(_tokenIds), "Lottery is closed!");
        require(msg.sender != owner() && msg.sender != lotteryToken.owner(), "Admin Cannot Place A Bid!");
        uint requiredTokenAmounts = lotteryInfo.getDefaultItemBid(_tokenIds);
        require(lotteryToken.balanceOf(msg.sender) >= requiredTokenAmounts, "No Necessary Funds To Partecipate!");
        address lotteryTokenOwner = lotteryToken.owner();
        lotteryToken.transferFrom(msg.sender, lotteryTokenOwner, requiredTokenAmounts);
        lotteryInfo.updateBid(_tokenIds, requiredTokenAmounts);
        lotteryInfo.updateAddress(_tokenIds, msg.sender);
        emit BidCorrect(msg.sender, _tokenIds, requiredTokenAmounts);
    }
}