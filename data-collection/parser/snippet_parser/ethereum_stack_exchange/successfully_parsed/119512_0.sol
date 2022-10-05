
contract MyContract {

    uint public numberOfOffer;
    address[] public buyersAddresses; 


    struct offerModel {
        address sellerWalletAddress;
        string sellerName;
        uint itemCount;
        string itemName;
        string itemSpecification;
        uint itemPrice;

    }

    
    mapping (uint => offerModel) public offers;


    function createOffer(string _sellerName , uint _itemCount, string _itemName , string _itemSpecification , uint _itemPrice) external {

        numberOfOffer ++;
        offers[numberOfOffer].sellerWalletAddress = msg.sender;
        offers[numberOfOffer].sellerName = _sellerName;
        offers[numberOfOffer].itemCount = _itemCount;
        offers[numberOfOffer].itemName = _itemName;
        offers[numberOfOffer].itemSpecification = _itemSpecification;
        offers[numberOfOffer].itemPrice = _itemPrice;

    }

    function searchOffers (string _itemName) public view returns(string) {
        for(uint i=0;i<numberOfOffer;i++)
        {
            if(keccak256(offers[i].itemName) == keccak256(_itemName)){
                return offers[i];
            }
        }
    }
}
