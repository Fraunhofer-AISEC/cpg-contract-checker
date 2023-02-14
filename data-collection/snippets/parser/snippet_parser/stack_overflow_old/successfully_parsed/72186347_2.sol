contract TEST101 {
    ITRC20 USDT;
    address payable public owner;
    address payable public ma;
    address payable public fw;

    struct User {
        uint256 commission_balance;
        uint256 member_id;
        uint40 membership_time;
        uint256 order_history;
    }

    struct History {
        uint256 order_amount;
        uint40 order_time;
    }

    struct Admin {
        uint256 active;
    }

    mapping(uint256 => User) public users;
    mapping(address => Admin) public admins;
    mapping(uint256 => mapping(uint256 => History)) public histories;

    event BuymemberShip(address user_wallet, uint256 member_id, uint256 amount, uint40 time);
    event BuyProduct(address user_wallet, uint256 member_id, uint256 amount, uint40 time);
    event Withdraw(address user_wallet, uint256 member_id, uint256 amount, uint40 time);
    event UpdateBalance(address user_wallet, uint256 member_id, uint256 amount, uint40 time);

    constructor(address payable _ma, ITRC20 _usdt, address payable _fw)  {
        ma = _ma;
        owner = payable(msg.sender);
        USDT = _usdt;
        fw = _fw;
    }

    function buyMembership(uint256 _mid, uint256 _amount, uint256 _charges) external {
        USDT.transferFrom(msg.sender, address(this), _amount);
        users[_mid].membership_time = uint40(block.timestamp);
        users[_mid].order_history = 0;
        users[_mid].member_id = _mid;
        USDT.transfer(fw, _charges);
        emit BuymemberShip(msg.sender, _mid, _amount, uint40(block.timestamp));
    }

    function purchase(uint256 _mid, uint256 _amount) external {
        USDT.transferFrom(msg.sender, address(this), _amount);
        users[_mid].order_history += 1;
        histories[_mid][users[_mid].order_history].order_amount = _amount;
        histories[_mid][users[_mid].order_history].order_time = uint40(block.timestamp);
        emit BuyProduct(msg.sender, _mid, _amount, uint40(block.timestamp));
    }

    function withdraw(address addr, uint256 _mid, uint256 _amount) external {
        if (admins[msg.sender].active == 1 || msg.sender == ma) {
            if (users[_mid].commission_balance >= _amount) {
                users[_mid].commission_balance -= _amount;
                USDT.transfer(msg.sender, _amount);
                emit Withdraw(msg.sender, _mid, _amount, uint40(block.timestamp));
            } else {
                revert("not enough balance");
            }
        } else {
            revert("permission denied");
        }
    }
}
