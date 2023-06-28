
pragma solidity ^0.8.4;

import "./TipWallet.sol";

contract Tipper {

    TipWallet wallet;
    address[] public buyers;

    constructor(address payable _walletContract) {
        wallet = TipWallet(_walletContract);
    }

    function buy() public payable {
        
        wallet.payTip();
        buyers.push(msg.sender);

    }


}

