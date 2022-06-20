pragma experimental ABIEncoderV2;
pragma solidity ^0.6.12;
contract Bond {
    struct Bond {
        uint deposit_value;
        uint creationblock;
        uint redemptionblock;
    }
    mapping(address => Bond[]) BondLedger;

    function createBond() payable public {
        
        
        
        Bond[] storage temporaryBondList;
        temporaryBondList = BondLedger[msg.sender];
        
        Bond memory newBond;
        newBond.deposit_value = msg.value;
        newBond.creationblock = block.number;
        newBond.redemptionblock = block.number + 100;
        
        
        temporaryBondList[temporaryBondList.length - 1] = newBond;
        BondLedger[msg.sender] = temporaryBondList;
    }
}
