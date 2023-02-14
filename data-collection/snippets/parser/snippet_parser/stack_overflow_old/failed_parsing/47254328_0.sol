struct data{
    bytes32 data_id;
    address bidder;
    uint bid;
}

mapping(bytes32=>data) bidInfo;
mapping(address=>data[]) dataOwned;   
address[] dataOwners;                 

function Bid(bytes32 data_id) public payable { ... }
function closeBid(bytes32 data_id) public { ... }
function whoOwns(bytes32 _data_id) constant public returns (address){ ... }

function dataOwnedBy(address _addr) constant public returns (bytes32[10]){
    uint length = dataOwned[_addr].length;
    bytes32[10] memory _idArray;               
    for (uint i=0;i<length;i++){
        _idArray[i] = (dataOwned[_addr][i].data_id);
    }
    return _idArray;
}
