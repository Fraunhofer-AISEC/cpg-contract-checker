pragma solidity >=0.7.0 <0.9.0;

contract Vault is ReentrancyGuard {
    
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    
    struct AccountDetails {
        string accountName;
        uint creationTime;
    }

    mapping (address => AccountDetails) accountDetails;
    mapping (address => uint256) totalDeposited;
    mapping (address => uint256) balances;

    
    function accountDeposit() public payable {
        if(accountDetails[msg.sender].creationTime == 0){
            require(msg.value > 0, "You must deposit more than 0.");
            balances[msg.sender] += msg.value;
            totalDeposited[msg.sender] += msg.value;

            AccountDetails memory details = AccountDetails("unnamed", block.timestamp);
            accountDetails[msg.sender] = details;
        } else {
            require(msg.value > 0, "You must deposit more than 0.");
            balances[msg.sender] += msg.value;
            totalDeposited[msg.sender] += msg.value;
        }
    }

    
    function accountWithdraw(uint256 _amount) public payable nonReentrant {
        require(balanceOf(msg.sender) >= _amount, "No funds to withdraw.");

        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

    
    function balanceOf(address account) private view returns (uint256) {
        return balances[account];
    } 

    
    function changeAccountName(string memory _name) public {
         if(accountDetails[msg.sender].creationTime == 0){
            revert("You do not have an account, make a deposit to create an account.");
        }
        accountDetails[msg.sender].accountName = _name;
    }

    
    function accountName() public view returns (string memory) {
        if(accountDetails[msg.sender].creationTime == 0){
            revert("You do not have an account, make a deposit to create an account.");
        }
        return accountDetails[msg.sender].accountName;
    }

    
    function checkBalance() public view returns (uint256) {
        if(accountDetails[msg.sender].creationTime == 0){
            revert("You do not have an account, make a deposit to create an account.");
        }
            return balances[msg.sender];
        }

    
    function checkTotalDeposit() public view returns (uint256) {
    if(accountDetails[msg.sender].creationTime == 0){
        revert("You do not have an account, make a deposit to create an account.");
    }
        return totalDeposited[msg.sender];
    }        

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
}
}
