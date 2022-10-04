pragma solidity ^0.8.7;

import "@uniswap/v2-core/contracts/interfaces/IUniswapV2Factory.sol";
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";

interface IBEP20 {
   
}

contract BEP20Token is Context, IBEP20, Ownable {
    using SafeMath for uint256;

    mapping (address => uint256) private _balances;
    mapping (address => mapping (address => uint256)) private _allowances;
    
    mapping(address => bool) private _pair;
    
    string private _symbol;
    string private _name;
    uint256 private _totalSupply;
    uint8   private _decimals;
    uint256 private _developmentTax = 3;

    address private constant _factoryAddress = 0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73;
    address private constant _routerAddress = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    address private constant _deadAddress = 0x000000000000000000000000000000000000dEaD;
    address private _pairAddress;

    IUniswapV2Factory private _factory;
    IUniswapV2Router02 private _router;

  constructor()  {
    _name = "My Token";
    _symbol = "TKN";
    _decimals = 18;
    _totalSupply = 1000 * 10 ** 18;
    _balances[_msgSender()] = _totalSupply;
    _maxTransferLimit = _totalSupply;

    _router = IUniswapV2Router02(_routerAddress);
    _factory = IUniswapV2Factory(_factoryAddress);   
    
    addPair(_factory.createPair(address(this), _router.WETH()));
    
    emit Transfer(address(0), msg.sender, _totalSupply);

  }

    function addPair(address pairAddress) public onlyOwner {
        _pair[pairAddress] = true;
        _pairAddress = pairAddress;
        emit AddPair(pairAddress);
    }


}
