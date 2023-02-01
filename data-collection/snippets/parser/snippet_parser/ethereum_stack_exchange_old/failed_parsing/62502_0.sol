**

  import "https://github.com/OpenZeppelin/openzeppelin- 
  solidity/contracts/token/ERC20/ERC20Pausable.sol";
  import "https://github.com/OpenZeppelin/openzeppelin- 
  solidity/contracts/ownership/Ownable.sol";

  pragma solidity ^0.4.17;

 contract MetaToken is Pausable{

string public name = 'MetaMetaMeta! Token';
uint8 public decimals = 8;
string public symbol = 'M3T';
string public version = '0.4.0';

uint256 public blockReward = 1 * (10**uint256(decimals));
uint32 public halvingInterval = 210000;
uint256 public blockNumber = 0; 
uint256 public totalSupply = 0;
uint256 public target   = 0x0000ffff00000000000000000000000000000000000000000000000000000000; 
uint256 public powLimit = 0x0000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
uint40 public lastMinedOn; 
uint256 public randomness;

address public newContractAddress;

function MetaToken() Ownable() {
    lastMinedOn = uint40(block.timestamp);
    updateRandomness();
}


function updateRandomness() internal {
    randomness = uint256(sha3(sha3(uint256(block.blockhash(block.number-1)) + uint256(block.coinbase) + uint256(block.timestamp))));
}


function getRamdomness() view returns (uint256 currentRandomness) {
    return randomness;
}


function hash(uint256 nonce, uint256 currentRandomness) pure returns (uint256){
    return uint256(sha3(nonce+currentRandomness));
}


function checkProofOfWork(uint256 nonce, uint256 currentRandomness, uint256 currentTarget) pure returns (bool workAccepted){
    return uint256(hash(nonce, currentRandomness)) < currentTarget;
}


function checkMine(uint256 nonce) view returns (bool success) {
    return checkProofOfWork(nonce, getRamdomness(), target);
}


function mine(uint256 nonce) whenNotPaused returns (bool success) {
    require(checkMine(nonce));

    Mine(msg.sender, blockReward, uint40(block.timestamp) - uint40(lastMinedOn)); 

    balances[msg.sender] += blockReward; 
    blockNumber += 1;
    totalSupply += blockReward; 
    updateRandomness();

    
    var mul = (block.timestamp - lastMinedOn);
    if (mul > (60*2.5*2)) {
        mul = 60*2.5*2;
    }
    if (mul < (60*2.5/2)) {
        mul = 60*2.5/2;
    }
    target *= mul;
    target /= (60*2.5);

    if (target > powLimit) { 
        target = powLimit;
    }

    lastMinedOn = uint40(block.timestamp); 
    if (blockNumber % halvingInterval == 0) { 
        blockReward /= 2;
        RewardHalved();
    }

    return true;
}

function setNewContractAddress(address newAddress) onlyOwner {
    newContractAddress = newAddress;
}

event Mine(address indexed _miner, uint256 _reward, uint40 _seconds);
event RewardHalved();
}**
