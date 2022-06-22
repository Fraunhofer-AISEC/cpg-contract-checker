  pragma solidity 0.4.18;

contract Marketplace {

    uint public applePrice;
    mapping (address => uint) public applesBalance;
    address seller;

    function Marketplace(uint _applePrice, uint _initialAppleStock) {
        applePrice = _applePrice;
        seller = msg.sender; 
        applesBalance[seller]= _initialAppleStock;
    }

    function buyApplesFromSeller() payable {
        uint applesToBuy = msg.value / applePrice; 

        require(applesBalance[seller] >= applesToBuy);

        applesBalance[msg.sender] += applesToBuy;
        applesBalance[seller] -= applesToBuy;

        seller.transfer(msg.value);

    } 
}
