    function create(ArbitrableBlacklist.ItemStatus _status, uint _action) public {
        item = ArbitrableBlacklist.Item({
           status: _status,
           lastAction: _action
        });
    }
