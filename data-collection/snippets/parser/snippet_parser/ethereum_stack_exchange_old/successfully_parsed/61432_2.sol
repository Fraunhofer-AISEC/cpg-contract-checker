mapping (address => mapping(uint => uint)) public transactions;

function getAccountTransactions() public returns (uint[] tx) {

    return transactions[msg.sender];

}
