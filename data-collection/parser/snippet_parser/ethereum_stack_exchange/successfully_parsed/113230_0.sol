
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";   
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBase.sol";
import "@chainlink/contracts/src/v0.8/interfaces/KeeperCompatibleInterface.sol";

contract Mint_A_Gram is
    ERC1155,
    Ownable,
    VRFConsumerBase,
    KeeperCompatibleInterface,
    ReentrancyGuard
{
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    Counters.Counter private x_tokenIds; 
    string public x_tokenURI;
    uint256 public x_mintCount;
    bytes32 public x_keyHash;
    uint256 public x_chainlinkFee;
    uint256 public x_ticketFee;
    uint256 public x_lastTimeStamp;
    uint256 public x_interval;
    address public x_theWinner;
    address payable[] x_usersEntered;
    lotteryState public x_lotteryState;
    enum lotteryState {
        OPEN,
        Drawing_Winner
    }

    event enteredDraw(address indexed player);
    event requestedDrawWinner(bytes32 indexed requestId);
    event winnerChosen(address indexed player);

    constructor(
        address _vrfCoordinator,
        address _linkToken,
        bytes32 _keyHash,
        uint256 _chainlinkFee,
        uint256 _ticketFee,
        uint256 _interval
    ) ERC1155(x_tokenURI) VRFConsumerBase(_vrfCoordinator, _linkToken) {
        x_lastTimeStamp = block.timestamp;
        x_keyHash = _keyHash;
        x_chainlinkFee = _chainlinkFee;
        x_ticketFee = _ticketFee;
        x_interval = _interval;
        x_theWinner = 0x0000000000000000000000000000000000000000;
        x_lotteryState = lotteryState.OPEN;
    }
}