
pragma solidity ^0.8.6;

contract Dice {

    uint256 public nonce = 0;
    uint256 public predictedRandomNumber;
    function TheDice() public {
        bytes32 prevHash = blockhash(block.number - 1);
        bytes32 hash = keccak256(abi.encodePacked(prevHash, address(this), nonce));
        predictedRandomNumber = uint256(hash) % 16;
        nonce++;
    }

}

contract Roll {

    address public diceAddress;
    uint256 public nonce = 0;
    uint256 public predictedRandomNumber;
    function TheRoll() public {
        bytes32 prevHash = blockhash(block.number - 1);
        bytes32 hash = keccak256(abi.encodePacked(prevHash, diceAddress, nonce));
        predictedRandomNumber = uint256(hash) % 16;
        nonce++;
    }

    function setDiceAddress(address _diceAddress) public {
        diceAddress = _diceAddress;
    }

    
    function setNonce(uint216 _nonce) public {
        nonce = _nonce;
    }

}
