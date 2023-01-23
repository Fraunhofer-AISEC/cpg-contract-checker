pragma solidity ^0.5.7;

contract Will{
    address owner;
    uint fortune;
    bool isDeceased;

    constructor() payable public {
        owner = msg.sender;
        fortune = msg.value;
        isDeceased = false;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    modifier mustBeDeceased{
        require(isDeceased == true);
        _;
    }

    address payable[]  familyWallets;

    mapping(address => uint) inheritance;

    function setInheritance (address payable wallet, uint amount) public {
        familyWallets.push(wallet);
        inheritance[wallet] = amount;
    }

    function payout() private mustBeDeceased{
        for(uint i = 0; i<familyWallets.length;i++){
            familyWallets[i].tranfer(inheritance[familyWallets[i]]);
        }
    } 

    function deceased()public onlyOwner{
        isDeceased = true;
        payout();
    }

}
