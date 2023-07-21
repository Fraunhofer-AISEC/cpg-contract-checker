
pragma solidity ^0.8.9;


import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AutomationCompatibleInterface.sol";


error CoCWeb3__usernameAlreadyUsed();
error CoCWeb3__AddressFound(string username);
error CoCWeb3__UpkeepNotNeeded();

contract CodeofConflictWeb3 is VRFConsumerBaseV2, AutomationCompatibleInterface {
    
    

    
    VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
    uint64 private immutable i_subscriptionId;
    bytes32 private immutable i_gasLane;
    uint32 private immutable i_callbackGasLimit;
    uint256 private immutable i_interval;
    uint16 private constant REQUEST_CONFIRMATIONS = 3;
    uint32 private constant NUM_WORDS = 1;

    
    address owner;

    
    event NewPlayerCreated(address indexed playerAddress, string username);
    event AddressFound(address indexed existingAddress, string indexed playerUsername);
    event UsernameTaken(address indexed PlayerAddress);
    event RaidSuccessful(uint256 indexed percentage);
    event RaidUnsuccessful(uint256 indexed percentage);
    

    enum playerRank {
        LEVEL1,
        Level2,
        Level3
    }

    struct Players {
        string username;
        uint256 playerXP;
        playerRank rank;
        bool currentPlayer;
    }

    Players[] internal playersArray;

    mapping(address => Players) addressToPlayer; 

    Players player;

    modifier isOwner() {
        require(owner == msg.sender, "Not owner of contract");
        _;
    }

    constructor(
        address vrfCoordinatorV2,
        uint64 subscriptionId,
        bytes32 gasLane, 
        uint256 interval,
        uint32 callbackGasLimit
    ) VRFConsumerBaseV2(vrfCoordinatorV2) {
        owner = msg.sender;
        i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
        i_gasLane = gasLane;
        i_interval = interval;
        i_subscriptionId = subscriptionId;
        i_callbackGasLimit = callbackGasLimit;
    }

    function createNewPlayer(string memory _name) public isOwner {
        if (addressToPlayer[msg.sender].currentPlayer == true) {
            revert CoCWeb3__AddressFound(addressToPlayer[msg.sender].username);
        }
        player = Players(_name, 0, playerRank(0), true);
        addressToPlayer[msg.sender] = player;
        playersArray.push(player);
        emit NewPlayerCreated(msg.sender, player.username);
    }

    function checkUpkeep(
        bytes memory 
    ) public view override returns (bool upkeepNeeded, bytes memory ) {
        upkeepNeeded = true;
        return (upkeepNeeded, "0x0"); 
    }

    
    function performUpkeep(bytes calldata ) external override {
        (bool upkeepNeeded, ) = checkUpkeep("");
        
        if (!upkeepNeeded) {
            revert CoCWeb3__UpkeepNotNeeded();
        }
        uint256 requestId = i_vrfCoordinator.requestRandomWords(
            i_gasLane,
            i_subscriptionId,
            REQUEST_CONFIRMATIONS,
            i_callbackGasLimit,
            NUM_WORDS
        );
        
        
    }

    
    function fulfillRandomWords(
        uint256 ,
        uint256[] memory randomWords
    ) internal override {
        
        uint256 returnedNumber = randomWords[0] % 50;
        if (returnedNumber > 50) {
            emit RaidSuccessful(returnedNumber);
        } else {
            emit RaidUnsuccessful(returnedNumber);
        }
    }

    

    function getOwner() public view returns (address) {
        return owner;
    }

    function getPlayer(address _player) public view returns (Players memory) {
        return addressToPlayer[_player];
    }
}
