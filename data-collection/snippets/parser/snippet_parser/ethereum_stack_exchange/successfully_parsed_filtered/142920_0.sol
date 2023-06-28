
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
        (bool sent, ) = address(this).call{value: _tip} ("");
        require(sent, "Failed to send ether");
        balance += msg.value;
        
        tip += 1;
    }

    function getTip() public view returns(uint) {
        return tip;
    }
}

