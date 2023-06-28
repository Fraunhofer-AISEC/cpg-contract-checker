

pragma solidity >=0.7.0 <0.9.0;


contract Sales {

    struct Items {
        uint productID;
        string productname;
        address productOwner;
    }


    struct ItemsForSale {
        uint forSaleID;
        uint256 productID; 
        uint256 productPrice;

    }

    struct Offers {
        uint offerID;
        uint256 productID;
        uint256 offerPrice;
        address offerer;
        bool status;
    } 

    uint numItems;
    uint numSales;
    uint numOffer;
    mapping(uint => Items) public item;
    mapping(uint => ItemsForSale) public sales;
    mapping(uint => Offers) public offers;

    event Item(address indexed _owner, string _name, uint _ID);
    event Sale(uint _productID, address indexed _newowner, uint256 _value);
    event tranfer(uint _productID, address indexed _to);
    event Offer(address indexed _offerer, uint _offerID, uint _productID, uint256 _value);


    constructor(){
        
    }

    function createItem(string memory _productName) public {
        Items storage _item = item[numItems]; 
        _item.productID = numItems;
        _item.productname = _productName;
        _item.productOwner = msg.sender;
        numItems++;
        emit Item(msg.sender,_productName,numItems);
        }

    function listItemForSale(uint256 _productID, uint256 _productPrice) public {
        sales[numSales] = ItemsForSale(numSales,_productID,_productPrice*1 ether); 
        numSales++;
    }

    function Tranfer(uint _productID, address _to, uint256 _price) public payable{
        Items storage _itembought = item[_productID];
        require(_price == msg.value, "Product costs more");
        payable(_to).transfer(_price);
        _itembought.productOwner = msg.sender;
        emit tranfer(_productID,_to);
    }
    function buyItem(uint _forSaleID) public payable{
        Items storage _itembought = item[_forSaleID];
        ItemsForSale memory _itemSale = sales[_forSaleID];
        Tranfer(_itembought.productID,_itembought.productOwner,_itemSale.productPrice);
        emit Sale(_itembought.productID,msg.sender,_itemSale.productPrice);
    }

    function makeOffer(uint _productID) public payable{
        offers[numOffer]=Offers(numOffer,_productID, msg.value,msg.sender, true);
        emit Offer(msg.sender,numOffer,_productID, msg.value);
        numOffer++;
    }

    function withdrawalOffer(uint _offerID) public payable{
        Offers storage _offer = offers[_offerID];
        require(msg.sender == _offer.offerer, "Not The Offer Owner");
        payable(msg.sender).transfer(_offer.offerPrice);
        _offer.status = false;
    }

    function acceptOffer(uint _offerID) public payable{
        for (uint i = 0; i < numOffer; i++) {
            if (offers[i].offerID==_offerID) {
                require(item[offers[i].productID].productOwner == msg.sender, "Not The Product Owner");
                Tranfer(offers[i].productID,offers[i].offerer,offers[i].offerPrice);
            }
        }
    }

    function retrieveItem(uint _productID) public view returns(Items memory) {
        return item[_productID];
    }

    function retrieveItemForSale(uint _productID) public view returns(ItemsForSale memory) {
        for (uint i = 0; i < numSales; i++) {
            if (sales[i].productID==_productID) {
                return sales[i];
            }
        }
    }

    function retrieveOffer(uint _productID) public view returns(Offers memory) {
        for (uint i = 0; i < numOffer; i++) {
            if (offers[i].productID==_productID) {
                return offers[i];
            }
        }
    }
}
