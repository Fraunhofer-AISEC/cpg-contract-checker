struct Account {
uint256 balance; 
uint256 timeLocked; 
}
mapping (address => Account) public accounts;

function addBalance() public payable {
Account storage a = accounts[msg.sender];
a.balance = a.balance + msg.value;

}
