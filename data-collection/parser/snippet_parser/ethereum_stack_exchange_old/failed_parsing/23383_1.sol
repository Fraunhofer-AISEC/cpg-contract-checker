contract MyDataContract {
    address contractOwner = msg.sender;

    mapping(address => bool) approvedAccess;   
    mapping(address => bytes) dataMap;

    function approveAccess(address _addressToApprove) {
        require(msg.sender==contractOwner);
        approvedAccess[_addressToApprove] = true;
    }

    function getData(address _userAddressData) returns(bytes data) {
        require(approvedAccess[msg.sender]);
        data = dataMap[_userAddressData];
    }

    function setData(address _userAddressData, bytes data) {
        require(approvedAccess[msg.sender]);
        dataMap[_userAddressData] = data;
    }
}

contract MyConsumerContract {
    address contractOwner;
    MyDataContract dataContract;

    function MyConsumerContract(address _dataContract) {
        contractOwner = msg.sender;
        dataContract = MyDataContract(_dataContract);
    }

    function doSomething() {
       bytes data = dataContract.getData(msg.sender);
       ...
       dataContract.setData(msg.sender, data);
    }
}
