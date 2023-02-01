contract ArbitrableBlacklist {

    enum ItemStatus {
        Absent,                     
        Cleared,                      
    }

    struct Item {
        ItemStatus status;       
        uint lastAction;         

    }
}
