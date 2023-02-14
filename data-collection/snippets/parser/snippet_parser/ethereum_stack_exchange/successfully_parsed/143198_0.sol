contract DocumentRegistry {
    struct Document {
        uint32 var1;
        uint64 var2;
    }

    event DocUpdated(uint32 var1, uint64 var2);
    bytes32 public _DocumentHash;

    constructor() {
        Document memory doc = Document({var1: 0, var2: 0});
        _DocumentHash = keccak256(abi.encodePacked(doc.var1, doc.var2));
        emit DocUpdated(doc.var1, doc.var2);
    }

    function update(Document memory doc) external {
        bytes32 hashedDoc = keccak256(abi.encodePacked(doc.var1, doc.var2));
        require(hashedDoc == _DocumentHash, "Incorrect Document state");

        ++doc.var1;
        doc.var2 += 10;

        _DocumentHash = keccak256(abi.encodePacked(doc.var1, doc.var2));
        emit DocUpdated(doc.var1, doc.var2);
    }
}
