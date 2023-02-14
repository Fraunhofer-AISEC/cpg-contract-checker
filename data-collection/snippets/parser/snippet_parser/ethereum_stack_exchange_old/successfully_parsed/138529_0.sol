pragma solidity >=0.7.0 <0.9.0;
contract sales{

    struct Items{
        uint256 productID;
        string productname;
        address productOwner;
    }


    struct ItemsForSale{
        
        uint256 productID; 
        uint256 productPrice;

    }

    struct Offers{
        uint256 offerID;
        uint256 productID;
        uint256 offerPrice;

    } 

    uint numItems;
    uint numsaleItems;
    mapping(uint => Items) public item;
    mapping(uint => ItemsForSale) public sales;

    constructor(){
        
    }

    function createItem(string memory _productName) public returns (string memory, uint productID){
        productID = numItems++;
        Items storage _item = item[productID]; 
        _item.productID = productID;
        _item.productname = _productName;
        _item.productOwner = msg.sender;
        return ( "Your Item is listed with the Id:" , productID);
        }

    function listItemForSale(uint256 _productID, uint256 _productPrice) public{
        sales[_productID] = ItemsForSale(_productID,_productPrice);
    }

    function buyItem(uint _forSaleID) public payable{
        Items storage _itembought = item[_forSaleID];
        _itembought.productOwner = msg.sender; 
        
        
        

    }
}
