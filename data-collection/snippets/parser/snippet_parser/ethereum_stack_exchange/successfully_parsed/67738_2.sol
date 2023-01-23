pragma solidity 0.4.19;

contract BlackEye{

    uint public initial_supply = 1000000;

    mapping(address=> uint) public balances;   

    address ownerAddress;

    modifier onlyOwner {
        require(ownerAddress == msg.sender);
        _;
    }
    function BlackEye() public {
        ownerAddress = msg.sender;
        balances[address(this)] = initial_supply;
    }
    function deposit(address investor, uint rupee_invested) external onlyOwner {
        balances[investor] += rupee_invested;
        balances[address(this)] -= rupee_invested;
    }
    function send_money(address receiver , uint amount_send) external{
        require(balances[msg.sender] >= amount_send);
        balances[msg.sender] -= amount_send;
        balances[receiver] += amount_send;
    }
    function transferReserves(address receiver, uint amount) external onlyOwner {
        require(balances[address(this)] >= amount);
        balances[address(this)] -= amount;
        balances[receiver] += amount;
    }
}
