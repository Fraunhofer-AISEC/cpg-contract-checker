

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


pragma solidity ^0.8.4;

contract LotteryToken is Ownable, ERC20{

    mapping(address=>uint)private _balances;


    constructor(string memory name, string memory symbol, uint totalSupply)ERC20(name, symbol){
        _mint(msg.sender, totalSupply);
        _balances[msg.sender] = totalSupply;

    }

    

    function increaseAllowance(address spender, uint256 addedValue) public virtual override returns (bool) {
        address owner = owner();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }



    function _transfer(
        address _from,
        address _to,
        uint _amount
        )internal virtual override{
            _balances[_from] -= _amount;
            _balances[_to] += _amount;
            super._transfer(_from, _to, _amount);
        }
    


    function balanceOf(address account)public view virtual override returns(uint){
        return _balances[account];
    }

}
