
pragma solidity 0.8.17;
import "./interface/IExchange.sol";
import "./interface/IERC20.sol";

contract Exchange is IExchange {

    uint256 public decimals;
    uint256 public feePercentage;
    address public owner;
    address public tokenVault;
    address public erc20Contract;
    uint256 public invariant;
    uint256 public feesCollected;

constructor(address _tokenVault, address _erc20Contract,uint256 _tokenAmount ){
     require(_tokenVault != address(0), "Invalid address _tokenVault");
    require(_tokenVault.code.length==0, "_tokenVault cannot be a contract");
    require(_erc20Contract != address(0), "_erc20Contract cannot be zero address");
    require(_erc20Contract.code.length>0, "_erc20Contract is not a contract");
    require(_tokenAmount > 0, "Invalid _tokenAmount value");
    require(IERC20(_erc20Contract).getBalance(_tokenVault) >= _tokenAmount, "Insufficient tokens in the vault");
     owner = msg.sender;
     tokenVault = _tokenVault;
     erc20Contract = _erc20Contract;
     invariant = _tokenAmount;
     decimals = 18;
     feePercentage = 3;
     feesCollected = 0;
}
}