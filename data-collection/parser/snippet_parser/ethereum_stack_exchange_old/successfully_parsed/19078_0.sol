pragma solidity ^0.4.11;

import './TeamAllocation.sol';
import './UnsoldAllocation.sol';
import './zeppelin/SafeMath.sol';
import './zeppelin/token/StandardToken.sol';
import './zeppelin/ownership/Ownable.sol';

contract Token is StandardToken, Ownable {

    using SafeMath for uint;
    string public constant name = "SAMPLE";
    string public constant symbol = "SMP";
    uint public constant decimals = 18;

    TeamAllocation teamAllocation;
    UnsoldAllocation unsoldTokens;


    
    uint public constant tokenPrice  = 1 finney;

    
    address public tokenFactory;
    
    address public futureSale;

    
    uint public salePeriod;

    uint fundingStartBlock;
    uint fundingStopBlock;

    
    bool fundingMode = true;

    
    uint totalUsedTokens;

    event Refund(address indexed _from,uint256 _value);
    event Migrate(address indexed _from, address indexed _to, uint256 _value);

    modifier isNotFundable() {
        if (fundingMode) throw;
        _;
    }

    modifier isFundable() {
        if (!fundingMode) throw;
        _;
    }

    function Token(address _tokenFactory, uint256 _fundingStartBlock, uint256 _fundingStopBlock, address _icedWallet) {
      salePeriod = now.add(60 hours);
      tokenFactory = _tokenFactory;
      fundingStartBlock = _fundingStartBlock;
      fundingStopBlock = _fundingStopBlock;
      totalUsedTokens = 0;
      totalSupply = 800000000;
      futureSale = _icedWallet;
    }

    function pause() onlyOwner isFundable external returns (bool) {
      fundingMode = false;
    }

    function() payable isFundable external {
      if(now > salePeriod) throw;
      if(block.number < fundingStartBlock) throw;
      if(block.number > fundingStopBlock) throw;
      if(totalUsedTokens >= totalSupply) throw;

      if (msg.value < tokenPrice) throw;

      
      if(!tokenFactory.send(msg.value)) throw;

      uint numTokens = msg.value.div(tokenPrice);
      totalUsedTokens = totalUsedTokens.add(numTokens);
      if (totalUsedTokens > totalSupply) throw;

      balances[msg.sender] = balances[msg.sender].add(numTokens);

      Transfer(0, msg.sender, numTokens);
    }


    
    function checkSalePeriod() external constant returns (uint) {
      return salePeriod;
    }

    
    function fundingActive() constant isFundable external returns (bool){
      if(block.number < fundingStartBlock || block.number > fundingStopBlock || totalUsedTokens > totalSupply){
        return false;
      }
      return true;
    }

    
    function numberOfTokensLeft() constant returns (uint256) {
      if (block.number > fundingStopBlock) {
        return 0;
      }
      uint tokensAvailableForSale = totalSupply - totalUsedTokens;
      return tokensAvailableForSale;
    }

    function finalize() isFundable onlyOwner external {
      if ((block.number <= fundingStopBlock ||
        totalUsedTokens < minTokensForSale) &&
        totalUsedTokens < totalSupply) throw;

      if(futureSale == address(0)) throw;

        
        fundingMode = false;

        

        
        if (!tokenFactory.send(this.balance)) throw;
    }

    function refund() isFundable external {
      if(block.number <= fundingStopBlock) throw;
      if(totalUsedTokens >= minTokensForSale) throw;

      uint plrValue = balances[msg.sender];
      if(plrValue == 0) throw;

      balances[msg.sender] = 0;

      uint ethValue = plrValue.mul(tokenPrice);
      if(!msg.sender.send(ethValue)) throw;
      Refund(msg.sender, ethValue);
    }
}
