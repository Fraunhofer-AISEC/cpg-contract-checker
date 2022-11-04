    
    
    pragma solidity ^0.8.0;
    
    import "./ERC20.sol";
    
    contract Shinobi is ERC20 
    {
        constructor () ERC20 ("Shinobi Inu","SHI", 100000000 * 1e18,18){
            _balances[_msgSender()] += 100000000*1e18;
        }
    }
    
    mapping (address => uint256) _balances;
    
    function _msgSender() internal view virtual returns (address) {
            return msg.sender;
        }
