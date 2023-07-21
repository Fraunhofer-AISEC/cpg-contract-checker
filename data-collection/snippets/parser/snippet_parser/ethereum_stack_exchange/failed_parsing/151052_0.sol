BCCasino public casino;
BC1155 public token1155;
BCNFT public token721;
BCToken public token20;

Counters.Counter public machineIdCounter;

mapping(uint256 => uint256) public machineToAmount;
mapping(address => mapping(uint256 => uint256)) public deposits;  

event Deposit(
    address indexed user,
    uint256 indexed machine,
    uint256 amount
);

event Reward(
    address indexed user,
    uint256 indexed rewardType,
    uint256 amount
);

constructor() {}

function initialize(address _token20, address _token721, address _token1155) external onlyAdmin {
    token20 = BCToken(_token20);
    token721 = BCNFT(_token721);
    token1155 = BC1155(_token1155);
}


function addMachine(uint256 amount) external onlyAdmin returns(bool) {
    require(amount > 0, "Invalid amount");
    uint256 machineId = machineIdCounter.current();
    machineToAmount[machineId] = amount;
    machineIdCounter.increment();
    return true;
}

function deposit(uint256 machineId) external returns(bool) {
    require(machineId <= machineIdCounter.current(), "Invalid Machine ID");
    address user = msg.sender;
    uint256 amount = machineToAmount[machineId];
    token20.transferFrom(user, address(this), amount);
    deposits[user][machineId] += amount;
    emit Deposit(user, machineId, amount);
    return true;
}

function reward(address user, 
                uint256 amount, 
                uint256 rewardType, 
                uint256 machineId
) external onlyAdmin returns(bool) {
    require(rewardType < 3, "Invalid reward Type");
    require(
        deposits[user][machineId] >= machineToAmount[machineId],
        "User didn't make a deposit for the game. Invalid request"
    );

    deposits[user][machineId] -= machineToAmount[machineId];

    if(rewardType == 2) {
        token721.mint(user);
        emit Reward(user, 2, 1);
     } else if (rewardType == 1){
        token1155.mint(user, 1);
        emit Reward(user, 1, 1);
     } else {
        token20.mint(user, amount);
        emit Reward(user, 0, amount);
     }

     return true;
    }

function totalMachine() external view returns(uint256) {
    return machineIdCounter.current();
}
}
