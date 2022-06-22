
pragma solidity >=0.4.21 <0.7.0;
pragma experimental ABIEncoderV2;

contract SupplyChain {
    
    enum OwnerType {Any, Manufacturer, Ditributor, Retailer, Consumer}

    struct Owner {
        string id; 
        string name;
        OwnerType ownerType;
    }

    
    
    struct Transaction {
        string txid; 
        string previous;
        uint256 timestamp; 
        bool allowAny; 
        address owner;
        address destination;
        OwnerType destinationType; 
        string documentId; 
    }

    struct Item {
        string name;
        uint256 price;
        Transaction[] transactions;
    }
    mapping(uint256 => Item) items;
    mapping(address => Owner) owners;

    function createOwner(
        address account,
        string memory documentId,
        string memory name,
        uint8 roleType
    ) public returns (bool) {
        Owner memory owner = Owner(documentId, name, getRoleType(roleType));
        owners[account] = owner;
        return true;
    }

    function getOwner(address account) public returns (Owner memory) {
        Owner memory owner = owners[account];
        return owner;
    }
    
    function getRoleType(uint256 roleType)private returns (OwnerType){
        if(roleType==0){
            return OwnerType.Any;
        }else if(roleType == 1){
            return OwnerType.Manufacturer;
        }else if(roleType == 2){
            return OwnerType.Ditributor;
        }else if(roleType == 3){
            return OwnerType.Retailer;
        }else if(roleType == 4){
            return OwnerType.Consumer;
        }
    }

    function createItem(
        string memory itemName,
        uint256 itemPrice,
        string memory txid,
        uint256 timestamp,
        bool allowAny,
        address ownerId,
        address destination,
        uint256 destinationType,
        string memory documentId
    ) public {
        
        Owner memory owner = getOwner(ownerId);
        
        Transaction memory transaction = Transaction(
            txid,
            "", 
            timestamp,
            allowAny,
            ownerId,
            destination,
            getRoleType(destinationType),
            documentId
        );
        
        
        
        Transaction[1] memory transactionArray =  [transaction];
        Item memory item = Item(itemName, itemPrice, transactionArray);
        
        
        
        uint256 itemId = 1;
        
        items[itemId] = item;
    }
}

