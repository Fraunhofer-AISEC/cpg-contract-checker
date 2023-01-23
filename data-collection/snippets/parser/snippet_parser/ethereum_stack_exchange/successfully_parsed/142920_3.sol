pragma solidity ^0.8.4;
contract TipWallet {
    
    uint public tip; 
    uint public balance;

    constructor (uint _tip) {
        tip = _tip;
    }

    function payTip() public payable {
        uint _tip = getTip();
        require(_tip == msg.value, "no right tip");
        balance += msg.value;
        
        tip += 1;
    }

    function getTip() public view returns(uint) {
        return tip;
    }
}

contract Tipper {

    TipWallet wallet;
    address[] public buyers;

    constructor(address payable _walletContract) {
        wallet = TipWallet(_walletContract);
    }
    function buy() public payable {
        
        wallet.payTip{value: msg.value}();
        buyers.push(msg.sender);

    }
}
