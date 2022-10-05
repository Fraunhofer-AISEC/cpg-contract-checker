
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Context.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/Uniswap/v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol";


contract TokenName is ERC20, Ownable {

    using SafeMath for uint256;
 
    mapping (address => uint256) private _rOwned;
    mapping (address => uint256) private _tOwned;
    mapping (address => mapping (address => uint256)) private _allowances;
    mapping (address => bool) private _isExcludedFromFee;
    mapping (address => bool) private _isExcluded;

 address[] private _excluded;
    address payable private _BuyFeeWalletAddress = payable(0xC6CDE7C39eB2f0F0095F41570af89eFC2C1Ea828);
    address payable private _SellFeeWalletAddress = payable(0xC6CDE7C39eB2f0F0095F41570af89eFC2C1Ea828);

    uint256 public _BuyFee = 5;
    uint256 private _previousBuyFee = _BuyFee;

    uint256 public _SellFee = 9;
    uint256 private _previousSellFee = _SellFee;

constructor() ERC20("Token name" , "TONA") {
        _mint(msg.sender, 1000000 * 10 ** 18);


}

    function burn(uint amount) external{
        _burn(msg.sender, amount);
    }


    function SetBuyFee(uint256 BuyFee) external onlyOwner() {
        _BuyFee = BuyFee;
    }

    function SetSellFee(uint256 SellFee) external onlyOwner() {
        _SellFee = SellFee;
    }

}
