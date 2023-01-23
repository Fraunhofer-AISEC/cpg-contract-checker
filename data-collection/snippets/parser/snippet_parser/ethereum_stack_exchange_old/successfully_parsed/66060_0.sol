 contract DealFactory {
    address[] public deployedDeals;


    function createDeal() public payable  {
        address newDeal = new Deal(msg.sender);

        deployedDeals.push(newDeal);

    }

    function getDeals() public view returns (address[]) {
        return deployedDeals;
    } 
}
