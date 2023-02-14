pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Strings.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/VRFConsumerBase.sol";


contract Lottery is ERC1155, Ownable  {
    uint256 public constant Ticket = 0;
    uint256 public constant Koma = 1;
    uint256 public constant Daruma = 2;
    uint256 public constant Lemon = 3;


    constructor() ERC1155 ("https://ipfs.io/ipfs/Qmf4WrTsdhjfjsdhfjhdHZ1k5Wzkd3?filename=blank1.json"){
        _mint(msg.sender, One, 1000, "" );
        _mint(msg.sender, Two, 90, "" );
        _mint(msg.sender, Three, 35, "" );
        _mint(msg.sender, Four, 5, "" );
    }

    function uri(uint256 _tokenId) override public view returns (string memory) {
        return string(
            abi.encodePacked(
                "https://ipfs.io/ipfs/Qmf4WrTGA2fYJXsdfkhgkjh435k5Wzkd3?filename=blank1",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

    address addressRandomNumber;

    function setAddress(address _addressRandomNumber) external {
        addressRandomNumber = _addressRandomNumber;
    }

    function callGetRandomNumber() external view returns (bytes32){
        RandomNumber r = RandomNumber(addressRandomNumber);
        return r.getRandomNumber();
    }

    function callFulfillRandomness(uint256) external view {
        RandomNumber r = RandomNumber(addressRandomNumber);
        return r.fulfillRandomness(uint256);
    }

}  

contract RandomNumber is VRFConsumerBase {

    bytes32 public keyHash;
    uint256 public fee;
    uint256 public randomResult;

    constructor() VRFConsumerBase(0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, 0xa36085F69e2889c224210F603D836748e7dC0088) public {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4;
        fee = 0.1 * 10 ** 18; 
    }

    function getRandomNumber() public returns (bytes32 requestId) {
        return requestRandomness(keyHash, fee);
    }

    function fulfillRandomness(uint256 randomness) external {
        randomResult = randomness;
    }

}


    
