pragma solidity 0.4.19;

contract blackeye {
    uint public max_amount = 1000000;
    uint public total_balance_bought = 0;

    mapping(address => uint) total_balance;   

    address owneraddress;

    modifier onlyowner {
        require(owneraddress == msg.sender);
        _;
    }

    modifier can_buy_amount(uint rupee_invested) {
        require(rupee_invested + total_balance_bought <= max_amount);
        _;
    }

    function balance(address investor) external constant returns(uint) {
        return total_balance[investor];
    }

    function deposit(address creator, address investor, uint rupee_invested) external {
        if (msg.sender == address(creator)) {
            uint amount_bought = rupee_invested;
            total_balance[investor] += amount_bought;
            total_balance_bought += amount_bought;
        }
    }

    function withdraw(address creator, address investor, uint amount_sold) external {
        if (msg.sender == address(creator)) {
            total_balance[investor] -= amount_sold;
            total_balance_bought -= amount_sold;
        }
    }

    function send_money(address sender, address receiver, uint amount_send) external {
        total_balance[sender] -= amount_send;
        total_balance[receiver] += amount_send;
    }
}
