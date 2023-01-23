
pragma solidity >=0.4.21 <0.7.0;

contract PrinterMarketplace {
    uint256 public requestCount = 0;
    uint balance;
    address payable escrow = msg.sender;

    mapping(uint256 => Request) public requests;
    struct Request {
        uint256 id;
        string fileName;
        string fileHash;
        address payable client;
        address payable provider;
        string price;
        uint256 value;
        string status;
    }
    
    function purchaseOffer(
        uint256 _id,
        address payable _client,
        address payable _provider,
        string memory _fileHash
    ) public payable{
        requests[_id].status = "purchased";
        requests[_id].value = msg.value;
        emit OrderEvent(_id, _fileHash, _client, _provider, requests[_id].status);
        escrow.transfer(msg.value);
    }
    
    function transferMoney(
        uint256 _id
        ) public {
        address(uint160(requests[_id].provider)).transfer(requests[_id].value);
        requests[_id].status = "paid";
        }
}

