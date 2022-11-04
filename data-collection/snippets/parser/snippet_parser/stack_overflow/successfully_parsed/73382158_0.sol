

pragma solidity ^0.8.0;

contract Inheritance { 
    address owner;
    bool deceased;
    uint money;
    

    constructor () public payable {
        owner = msg.sender;
        money = msg.value;
        deceased = false;

}

modifier oneOwner {
    require (msg.sender == owner);
    _;
}

modifier isDeceased {
    require (deceased == true);
    _;

address [0xa1F9019E4F941071cAabCbb3fBc6314c06BeD18f] wallets;

mapping (address => uint) inheritance;
}

function setup(address _wallet, uint _inheritance) public oneOwner {
    _wallet.push(_wallet);
    Inheritance [_wallet] = _inheritance; 
}

function moneyPaid() private isDeceased {
    for (uint i=0; i< wallets.length; i++) {
        wallets[i].transfer(Inheritance[wallets][i]);
    }
}

function died() public oneOwner { 
    deceased = true; 
    moneyPaid();
}
}
