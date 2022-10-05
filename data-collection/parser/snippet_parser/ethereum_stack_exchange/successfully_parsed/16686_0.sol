pragma solidity ^0.4.6;

contract Oracle{
    struct DocumentStruct{
        uint value;
    }

    mapping(bytes32 => DocumentStruct) public documentStructs;

    function StoreDocument(bytes32 key, uint value) returns (bool success) {
        documentStructs[key].value = value;
        return true;
    }

}

contract Payment {
    address public counterparty1;
    address public counterparty2;
    uint public margin;
    address public oracleID;


    function Payment(address _cp2, address _oracleID) payable{
        margin = msg.value;
        counterparty1 = msg.sender;
        counterparty2 = _cp2;
        oracleID = _oracleID;
    }


    function Pay(bytes32 _keyval) returns (bool){
        var pValue = RetrieveData(_keyval);
        var npvalue = pValue >= margin ? (this.balance) : pValue;
        if (npvalue > 0 ){
            counterparty2.send(npvalue);
            return true;
        }
        else{
            throw;
        }
    }

    struct DocumentStruct{
        uint value;
    }    
    Oracle oracle;

    function RetrieveData(bytes32 key) 
    public
    constant
    returns(uint) 
    {
        oracle = Oracle(oracleID);
        DocumentStruct memory doc;
        (doc.value) = oracle.documentStructs(key);
        return doc.value;
    }
}
