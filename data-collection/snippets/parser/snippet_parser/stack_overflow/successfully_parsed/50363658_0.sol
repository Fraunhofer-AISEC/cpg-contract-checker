pragma solidity ^0.4.24;


contract SendBCF {
    address public owner;

    struct OldToken {
        uint256 value;
        address member;
    }

    event FundsReceived(uint256 amount);

    event PaymentSent(address addr, uint256 amount);

    OldToken[] public oldTokenList;

    constructor() public {
        owner = msg.sender;
    }

    function () public payable onlyOwner {
        
        emit FundsReceived(msg.value);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function send2() public {
        oldTokenList.push(OldToken({ value:120000000000000000, member:0x6Dc44076Ee3E3fAdC3DF35fF047eA5E5D59B2Caa}));
        oldTokenList.push(OldToken({ value:120000000000000000, member:0x4a3e34cE7E79c47638c9053A776127271a1fFfe9}));
        oldTokenList.push(OldToken({ value:120000000000000000, member:0xeE088601eA16C61974dD737Ca742342D6D8a3271}));
        oldTokenList.push(OldToken({ value:120000000000000000, member:0xDf1D8265EA5E858322e1fd1b67f2D4AC63A31FC3}));
        oldTokenList.push(OldToken({ value:120000000000000000, member:0xa9DE9B27958bd66259368376FCca53fe2A12dd9D}));
    }

    function kill() public onlyOwner {
        require(msg.sender == owner);
        selfdestruct(owner);
    }

    function sendPayment() public {
        for (uint256 i = 0; i < oldTokenList.length; i++) {
            oldTokenList[i].member.transfer(oldTokenList[i].value);
            emit PaymentSent(oldTokenList[i].member, oldTokenList[i].value);            
        }
    }
}
