interface IERC20 {

function totalSupply() external view returns (uint256);
function balanceOf(address account) external view returns (uint256);
function transfer(address recipient, uint256 amount) external returns (bool);
function allowance(address owner, address spender) external view returns (uint256);
function approve(address spender, uint256 amount) external returns (bool);

function transferFrom(
    address sender,
    address recipient,
    uint256 amount
) external returns (bool);

event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(address indexed owner, address indexed spender, uint256 value);
}

interface IKeeperRegistry {
function registerUpkeep(
    address target,
    uint32 gasLimit,
    address admin,
    bytes calldata checkData
) external returns (uint256 id);

function performUpkeep(uint256 id, bytes calldata performData) external returns (bool success);

function cancelUpkeep(uint256 id) external;

function addFunds(uint256 id, uint96 amount) external;
}

contract KeeperManager {

    
    address public KeeperRegistry;
    address public Target;
    address public chainlinkToken;
    address owner;
    uint256 public upkeepId;
    IKeeperRegistry _keeperRegistry;

    
    constructor(address keeperRegistry, address target, address chainlink) {
        KeeperRegistry = keeperRegistry;
        Target = target;
        owner = msg.sender;
        chainlinkToken = chainlink;
        _keeperRegistry = IKeeperRegistry(keeperRegistry);

    }

    function supply(uint256 upkeepId, uint96 amount) external {
        IERC20(chainlinkToken).approve(KeeperRegistry, amount);
        _keeperRegistry.addFunds(upkeepId, amount);
    }
}
