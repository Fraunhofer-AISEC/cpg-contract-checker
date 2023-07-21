
constructor() {
        setStock(1,[2,3,4,5,6,7,8,9,10],[2,3,4,5,6,7,8,9,10]);
        setStock(2,[11,12,13,14,15,16,17,18,19,20],[11,12,13,14,15,16,17,18,19,20]);
        setStock(3,[21,22,23,24,25,26,27,28,29,30],[21,22,23,24,25,26,27,28,29,30]);
    }

function setStock(
        uint256 ledgerType,
        uint8[] calldata typeDays,
        uint16[] calldata stock
    ) internal {
        require(ledgerType > 0, "Invalid ledger type");
        require(ledgerType < 6, "Invalid ledger type");
        require(msg.sender == tempAdmin, "Only admin");
        require(stock.length > 0, "Invalid stock array");
        require(typeDays.length == stock.length, "Invalid params");

        _setStock(ledgerType, typeDays, stock);
    }
