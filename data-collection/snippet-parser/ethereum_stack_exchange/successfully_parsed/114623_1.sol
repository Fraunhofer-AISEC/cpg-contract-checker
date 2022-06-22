
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

    event Transfered(address _from, address _to, uint256 amount);

    constructor() payable {
        owner = payable(msg.sender);
        balances[tx.origin] = 10000;
    }

    function sendCoin(address payable receiver, uint256 amount)
        payable public
        returns (bool sufficient)
    {
        require(msg.sender == owner);
        if (balances[msg.sender] < amount) return false;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        receiver.transfer(amount);
        emit Transfered(msg.sender, receiver, amount);
        return true;
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }

}
