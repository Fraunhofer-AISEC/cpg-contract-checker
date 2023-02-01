import "../../node_modules/zeppelin-solidity/contracts/token/ERC20/ERC20.sol"; 

contract Escrow is Ownable { 
    ERC20 public currency; 
    address public collectionAddress;

    function Escrow(ERC20 _currency, address _collectionAddress) public { 
        currency = _currency; 
        collectionAddress = _collectionAddress; 
    } 
}
