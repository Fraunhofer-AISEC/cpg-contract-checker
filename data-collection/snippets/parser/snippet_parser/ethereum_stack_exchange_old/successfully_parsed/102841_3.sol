
pragma solidity ^0.7.0;

import "./Store.sol";
import "./Base.sol";
import "./ContractManager.sol";

contract Reader is Base {
    Store public s;
    address storeAddress;
    ContractManager public c;
    constructor() {
        c = ContractManager(managerAddress);
        storeAddress = c.getAddress("Store");
        s = Store(storeAddress);
    }
    
    function setVal(uint _val) public {
        s.setValue(_val);
    }
}
