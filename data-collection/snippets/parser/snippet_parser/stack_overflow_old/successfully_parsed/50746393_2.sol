pragma solidity ^0.4.22;

contract ArbitrableBlacklist {

    enum ItemStatus {
        Absent,                     
        Cleared                    
    }

    struct Item {
        ItemStatus status;       
        uint lastAction;         

    }

}

contract test{

    ArbitrableBlacklist.Item public item;

    function create() public {
        item = ArbitrableBlacklist.Item({
           status: ArbitrableBlacklist.ItemStatus.Absent,
           lastAction: 0
        });
    }

}
