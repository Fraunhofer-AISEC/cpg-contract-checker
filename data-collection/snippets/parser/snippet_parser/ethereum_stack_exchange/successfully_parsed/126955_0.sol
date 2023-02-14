uint256 totalContractDeposited;

mapping(address => uint256) balanceOf;
mapping(address => string) addrsToAccName;
mapping(address => uint256) accCreationTimeStamp;
mapping(address => uint256) addrsToAccUniqueId;
mapping(uint256 => address) public accUniqueIdToAddrs;

event newAccountCreated(string accName, uint256 uniqueId, uint256 creationTimeStamp);
event accountNameChanged(string oldAccName, string newAccName, uint256 changeTimeStamp);
event withdrawalComplete(address _withdrawer, string _accNickName, uint256 _amount, uint256 _balanceBeforeWithdrawal, uint256 _balanceAfterWithdrawal);
event accountDeleted(address _deleter, uint256 _uniqueIdentifier, uint256 _deletionTimeStamp);
event accDepositComplete(address _depositer, string _accNickName, uint256 _amount);
event depositToUniqueIdComplete(address _depositer, address _receiverAccOwnerAddrs, string receiverAccName, uint256 _amount);

function createAcc(string memory _accName) public notUser {

    uint256 uniqueId = block.timestamp.mul(2).add(16);
    addrsToAccName[msg.sender] = _accName;
    accCreationTimeStamp[msg.sender] = block.timestamp;
    addrsToAccUniqueId[msg.sender] = uniqueId;
    accUniqueIdToAddrs[uniqueId] = msg.sender;

    emit newAccountCreated(_accName, uniqueId, block.timestamp);
}

function changeAccName(string memory _newAccName) public isUser {
    string memory oldAccName = addrsToAccName[msg.sender];
    addrsToAccName[msg.sender] = _newAccName;  

    emit accountNameChanged(oldAccName, _newAccName, block.timestamp);
}

function deleteAccount() public isUser {
    if(balanceOf[msg.sender] > 0) {
        uint256 amount = balanceOf[msg.sender];
        balanceOf[msg.sender] = 0;
        payable(msg.sender).transfer(amount);

        emit withdrawalComplete(msg.sender, addrsToAccName[msg.sender] , amount, balanceOf[msg.sender].add(amount), balanceOf[msg.sender]);
    }
    uint256 _oldUniqueIdentifier = addrsToAccUniqueId[msg.sender];
    addrsToAccName[msg.sender] = "";
    accCreationTimeStamp[msg.sender] = 0;
    addrsToAccUniqueId[msg.sender] = 0;
    accUniqueIdToAddrs[_oldUniqueIdentifier] = address(0);

    emit accountDeleted(msg.sender, _oldUniqueIdentifier, block.timestamp);
}

function accDeposit() public payable isUser {
    balanceOf[msg.sender] += msg.value;
    totalContractDeposited += msg.value;

    emit accDepositComplete(msg.sender, addrsToAccName[msg.sender], msg.value);
}

function depositToUniqueIdentifier(uint256 _uniqueId) public payment payable {
    require(accUniqueIdToAddrs[_uniqueId] != 0x0000000000000000000000000000000000000000, "Unique identifier does not exist.");
    balanceOf[accUniqueIdToAddrs[_uniqueId]] += msg.value;

    emit depositToUniqueIdComplete(msg.sender, accUniqueIdToAddrs[_uniqueId], addrsToAccName[accUniqueIdToAddrs[_uniqueId]], msg.value);
}

function viewAccDetails() public view  returns(string memory accountName, uint256 uniqueId, uint256 creationTimeStamp) {

    return(addrsToAccName[msg.sender], addrsToAccUniqueId[msg.sender], accCreationTimeStamp[msg.sender]);
}

function viewAccDetailsOf(address _address) public view returns(string memory accountName, uint256 uniqueId, uint256 creationTimeStamp) {
    require(accCreationTimeStamp[_address] != 0, "You dont have an account.");
    return(addrsToAccName[_address], addrsToAccUniqueId[_address], accCreationTimeStamp[_address]);
}

function viewUniqueIdToAddrs(uint256 _uniqueId) public view onlyOwner returns(address uniqueIdToAddrs){
    require(accUniqueIdToAddrs[_uniqueId] != address(0), "uniqueId does not exist.");
    return(accUniqueIdToAddrs[_uniqueId]);
}

modifier notUser() {
    require(accCreationTimeStamp[msg.sender] == 0, "You already have an account.");
    _;
} 

modifier isUser() {
    require(accCreationTimeStamp[msg.sender] != 0, "You dont have an account.");
    _;
} 

modifier payment() {
    require(msg.value > 0, "You are trying to deposit an invalid amount.");
    _;
}  
