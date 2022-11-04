pragma solidity ^0.7.0;
import "../openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "../openzeppelin-contracts/contracts/math/SafeMath.sol";

contract ERC20Token is IERC20 {
  using SafeMath for uint256;
  bytes32[] public candidateList;
   
  uint public totalTokens;
  uint public balanceTokens;
  uint public tokenPrice;
   
  
  
  
   
  struct voter {
    address voterAddress;
    uint tokensBought;
    uint256[] tokensUsedPerCandidate;
  }
   
  mapping(address => voter) public voterInfo;
   
  mapping(bytes32 => uint256) public votesReceived;

  string public symbol;
  string public  name;
  uint8 public decimals;

  mapping(address => uint256) balances;
  mapping(address => mapping(address => uint256)) allowed;
  
  constructor(uint256 _totalTokens, uint256 _tokenPrice, bytes32[] memory _candidateNames)  {
    symbol = "NCToken";
    name = "NCSOFT TOKEN";
    decimals = 0;
    totalTokens = _totalTokens;
    balanceTokens = _totalTokens;
    tokenPrice = _tokenPrice;
    candidateList = _candidateNames;
    emit Transfer(address(0), msg.sender, totalTokens);


   function transferFrom(address from, address to, uint256 tokens) public override returns (bool) { 
        balances[from] = SafeMath.sub(balances[from], tokens);
        allowed[from][msg.sender] = SafeMath.sub(allowed[from][msg.sender], tokens);
        balances[to] = SafeMath.add(balances[to], tokens);
        emit Transfer(from, to, tokens);
        return true;
    }

}
