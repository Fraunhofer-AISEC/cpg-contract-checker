
pragma solidity >=0.7.4;
pragma experimental ABIEncoderV2;

contract Ledger {
    struct TransferRequest {
        string title;
        uint256 amount;
        string bsb;
        string accountName;
        string accountNumber;
    }

    mapping(address => uint256) balances;

    address payable owner;

    event Transfered(bool _success, address _from, address _to, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
        balances[tx.origin] = 10000;
    }

    function sendCoin(address payable receiver, uint256 amount)
        payable public
    {
        require(msg.sender == owner);
        if (balances[msg.sender] < amount) return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Transfered(true, msg.sender, receiver, amount);
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }

}

