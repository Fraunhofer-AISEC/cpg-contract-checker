contract Pool is Timed {

    string public name;
    uint256 public amountDeposited;
    address private weth;

    mapping(address => uint256) public userBalance;

    event Deposit(address indexed user, string indexed name, uint256 amount);

    constructor(
        string memory _name,
        uint256 _deadline,
        address _weth
    ) public {
        require(_deadline > block.timestamp);
        name = _name;
        deadline = _deadline;
        weth = new ERC20(_weth);
    }

    function makeDeposit(uint256 _amtDeposited) public payable {
        require(_amtDeposited > 0);

        weth.transferFrom(msg.sender, address(this), _amtDeposited);

        amountDeposited += userBalance[msg.sender];

        emit Deposit(msg.sender, name, msg.value);
    }
}