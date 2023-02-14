mapping(address => uint) public balances;

modifier onlyRegistered(address _userAddress) {
    require(isUserExists(_userAddress), "User Doesn't exists");
        _;
    }
function getBalance() onlyRegistered(msg.sender) external view returns(uint) {
     return balances[msg.sender];
 }
