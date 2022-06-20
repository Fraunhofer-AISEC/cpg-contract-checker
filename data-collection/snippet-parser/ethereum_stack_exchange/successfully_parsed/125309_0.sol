
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract Stakeable is ERC20, Ownable{
        using SafeMath for uint256;
    
        string private constant _name = "Schrodinger";
        string private constant _symbol = "Kitty Dinger";
        
        
        address[] internal stakeholders;
    
        
        mapping(address => uint256) internal stakes;
    
        
        mapping(address => uint256) internal rewards;
    
        
    
        constructor(string memory name_, string memory symbol_, address _owner, uint256 _supply)
        {    
            name_ = _name;
            symbol_ = _symbol;
            _mint(_owner, _supply);
        }
}