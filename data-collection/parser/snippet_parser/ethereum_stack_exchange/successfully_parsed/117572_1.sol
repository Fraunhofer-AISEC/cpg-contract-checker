
pragma solidity ^0.8.3;

import "./Interfaces/IShop.sol";
import "./PoToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Shop is IShop, Ownable {

   
    
    struct Item {
        uint256 id;
        uint256 weight;
        string name;
        uint256 value;
    }

    
    
    mapping(address => mapping(uint256 => Item)) public ownedItems;

    
    uint256 private _itemsCount;

    address private _poTokenContractAddress;


    constructor (address poTokenContract) {
        _itemsCount = 1;

        _poTokenContractAddress = poTokenContract;
    }

     function buyItem(uint256 itemId, uint256 amountPaid) external override returns (bool) {

        
        require(ownedItems[address(0)][itemId].id == itemId, "The selected item is not available.");

        
        require(amountPaid == ownedItems[address(0)][itemId].value,"The sent amount has to be equal to the item value");

        
        
        (bool transferSucceded, )  = _poTokenContractAddress.delegatecall(abi.encodeWithSignature("transfer(address recipient, uint256 amount)", owner(),amountPaid));

        require(transferSucceded == true, "The Payment failed");
        
        ownedItems[msg.sender][itemId] = ownedItems[address(0)][itemId];

        
        delete(ownedItems[address(0)][itemId]);

        
        emit itemBoughtEvent(msg.sender, itemId, amountPaid);

        return true;
     }
}
