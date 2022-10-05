pragma solidity ^0.5.2;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20Mintable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v2.5.0/contracts/token/ERC20/ERC20Detailed.sol";



contract HoneyTest is ERC20Mintable, ERC20Detailed {
    
    using SafeMath for uint256;
    
    uint256 public roundMask; 
    uint256 public lastMintedBlockNumber; 
    uint256 public totalParticipants = 0; 
    uint256 public tokensPerBlock; 
    uint256 public initalTokenPB; 
    uint256 public blockFreezeInterval; 
    uint256 public initialTime = 0; 
    uint256 private initialBlock = block.number; 
    address public tokencontractAddress = address(this);
    mapping(address => uint256) public participantMask;
    
    
     constructor(uint256 initialSupply, uint256 _tokensPerBlock, uint256 _blockFreezeInterval) public ERC20Detailed("HoneyTest", "HON", 18){ 
        lastMintedBlockNumber = block.number;
        tokensPerBlock = _tokensPerBlock;
        blockFreezeInterval = _blockFreezeInterval;
        initalTokenPB = _tokensPerBlock;
        _mint(msg.sender, initialSupply);
       
    }
    
    modifier isAuthorized(){  
        require(isMinter(msg.sender));
        _;
    }
    
    
    
    function addMinters(address _minter) external returns (bool) {
        _addMinter(_minter);
        totalParticipants = totalParticipants.add(1);
        updateParticipantMask(_minter);
        return true;
    }
    
    
     
    function removeMinters(address _minter) external returns (bool) {
        totalParticipants = totalParticipants.sub(1);
        _removeMinter(_minter);
        return true;
    }
    
    
    function trigger() external isAuthorized returns (bool) {
        uint256 bp = 8000; 
        if(totalSupply() < 1000000000){
        
            if(block.number - initialBlock  >= initialBlock + 90 && block.number - initialBlock < initialBlock + 180  && tokensPerBlock == initalTokenPB){
                tokensPerBlock = initalTokenPB * bp / 10000;
            }
            else if(block.number - initialBlock  >= initialBlock + 180){
                initalTokenPB = tokensPerBlock;
                initialBlock = initialBlock + 180 ;
            }
            bool res = readyToMint();
            if(res == false) {
                return false;
            }
            else {
                mintTokens();
                return true;
            }
            
        }
    }
    
    
    
    function withdraw() external isAuthorized returns(bool){
        
        uint256 amount = calculateRewards();
        require(amount > 0);
        ERC20(tokencontractAddress).transfer(msg.sender, amount);
    }
    
    
    function readyToMint() public view returns(bool) {
        uint256 currentBlockNumber = block.number;
        uint256 lastBlockNumber = lastMintedBlockNumber;
        if(currentBlockNumber > lastBlockNumber + blockFreezeInterval){
            return true;
        }
        else {
            return false;
        }
    }
    
     
    function calculateRewards() private returns (uint256) {
        uint256 playerMask = participantMask[msg.sender];
        uint256 rewards = roundMask.sub(playerMask); 
        updateParticipantMask(msg.sender);
        return rewards;
    }
    
    
     function mintTokens() private returns(bool) {
         uint256 currentBlockNumber = block.number;
         uint256 tokenReleaseAmount = (currentBlockNumber.sub(lastMintedBlockNumber)).mul(tokensPerBlock);
         lastMintedBlockNumber = currentBlockNumber;
         mint(tokencontractAddress, tokenReleaseAmount);
         calculateTPP(tokenReleaseAmount);
         return true;
     }
     
     function calculateTPP(uint256 tokens) private returns(bool) {
         uint256 tpp = tokens.div(totalParticipants);
         updateRoundMask(tpp);
         return true;
     }
      
     function updateRoundMask(uint256 tpp) private returns(bool){
        roundMask = roundMask.add(tpp);
        return true;
     }
     
     
      function updateParticipantMask(address participant) private returns(bool){
          uint256 previousRoundMask = roundMask;
          participantMask[participant] = previousRoundMask;
          return true;
      }
    
    
    
    
    
    
    
    
    
    
    
}
