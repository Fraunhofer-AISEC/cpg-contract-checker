pragma solidity ^0.8.9;

import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";

contract RandomDay is VRFConsumerBase {
    
    uint256 private constant ROLL_IN_PROGRESS = 42;
    bytes32 private s_keyHash;
    uint256 private s_fee;

    mapping(bytes32 => address) private s_rollers;
    mapping(address => uint256) private s_results;

    event DiceRolled(bytes32 indexed requestId, address indexed roller);
    event DiceLanded(bytes32 indexed requestId, uint256 indexed result);

    constructor(address vrfCoordinator, address link, bytes32 keyHash, uint256 fee) VRFConsumerBase(vrfCoordinator, link) {
        s_keyHash = keyHash;
        s_fee = fee;
   
    }

    function rollDice (address roller) public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= s_fee, "Not enough LINK to pay fee");
        require(s_results[roller] == 0, "Already rolled");
        requestId = requestRandomness(s_keyHash, s_fee);
        s_rollers[requestId] = roller;
        s_results[roller] = ROLL_IN_PROGRESS;
        emit DiceRolled(requestId, roller);
        return requestId;
    }

    function fulfillRandomness (bytes32 requestId, uint256 randomness) internal override {
        uint256 dayOfWeek = (randomness % 7) + 1;
        s_results[s_rollers[requestId]] = dayOfWeek;
        emit DiceLanded(requestId, dayOfWeek);
    }

    function weekday (address player) public view returns (string memory) {
        require(s_results[player] != 0, "Dice not rolled");
        require(s_results[player] != ROLL_IN_PROGRESS, "Roll in progress");
        return getWeekdayName(s_results[player]);
    }

    function getWeekdayName (uint256 id) private pure returns (string memory) {
        string[7] memory weekdays = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        return weekdays[id - 1];
    }

}
