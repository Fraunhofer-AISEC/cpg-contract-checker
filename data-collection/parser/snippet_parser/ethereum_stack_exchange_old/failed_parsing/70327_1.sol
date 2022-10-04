contract send_ether{
mapping(address => uint256) public balances;

function depositFunds() public payable {
    balances[msg.sender] += msg.value;
    }

function close() public {
    selfdestruct('first contract's address);
}
