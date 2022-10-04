pragma solidity ^0.4.23;

contract Owned {
    address public owner;

    constructor() public { 
        owner = tx.origin;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function isDeployed() public pure returns(bool) {
        return true;
    }
}

contract Season is Owned {
    uint64 public begin;
    uint64 public end;
    string name;

    Request[] requests;
    mapping(bytes30 => uint) requestServiceNumberToIndex;

    event RequestCreated(bytes30 indexed serviceNumber, uint index);

    constructor(uint64 begin_, uint64 end_, string name_) public {
        begin = begin_;
        end = end_;
        name = name_;
    }

    function createRequest(bytes30 serviceNumber, uint64 date, DeclarantType declarantType, string declarantName, uint64 fairId, uint64[] assortment, uint64 district, uint64 region, string additionalData) public onlyOwner {     
        uint index = requestServiceNumberToIndex[serviceNumber];

        require(index == 0 && (requests.length == 0 || requests[0].serviceNumber != serviceNumber));

        requests.length++;
        index = requests.length - 1;    
        requestServiceNumberToIndex[serviceNumber] = index;

        Request storage request = requests[index];

        request.serviceNumber = serviceNumber;
        request.date = date;
        request.declarantType = declarantType;
        request.declarantName = declarantName;
        request.fairId = fairId;
        request.district = district;
        request.region = region;
        request.assortment = assortment;
        request.additionalData = additionalData;

        emit RequestCreated(serviceNumber, index);
    }

    function getSeasonDetails() public view returns(uint64, uint64, string) {
        return (begin, end, name);
    }

    function getRequestByServiceNumber(bytes30 serviceNumber) public view returns(bytes30, uint64, DeclarantType, string, uint64, uint64[], uint64, uint64, string) {
        return getRequestByIndex(requestServiceNumberToIndex[serviceNumber]);
    }

    function getRequestByIndex(uint index) public view returns(bytes30, uint64, DeclarantType, string, uint64, uint64[], uint64, uint64, string) {
        Request storage request = requests[index];
        bytes30 serviceNumber = request.serviceNumber;
        string memory declarantName = request.declarantName;
        uint64[] memory assortment = getAssortment(request);        
        string memory additionalData = request.additionalData;
        return (serviceNumber, request.date, request.declarantType, declarantName, request.fairId, assortment, request.district, request.region, additionalData);
    }

    function getAssortment(Request request) private pure returns(uint64[]) {
        uint64[] memory memoryAssortment = new uint64[](request.assortment.length);
        for (uint i = 0; i < request.assortment.length; i++) {
            memoryAssortment[i] = request.assortment[i];
        }
        return memoryAssortment;
    }

    struct Request {
        bytes30 serviceNumber;
        uint64 date;
        DeclarantType  declarantType;
        string declarantName;
        uint64 fairId;
        uint64[] assortment;
        uint64 district;
        uint64 region;
        string additionalData;
    }

    enum DeclarantType {
        A,
        B,
        C,
        D
    }
}
