pragma solidity 0.5.0;

contract Shop {

    struct ShopOwner {
        string name;
        bytes32[] productList;
    }

    address[] public shopOwnerIds;
    mapping(address => ShopOwner) public shopOwners;

    struct Product {
        string name;
    }

    function shopCount() public view returns(uint) { return shopOwnerIds.length; }
    function shopProductCount(address shopOwnerId) public view returns(uint) { return shopOwners[shopOwnerId].productList.length; }

    function shopOwnerProductIdAtIndex(address shopOwnerId, uint row) public view returns(bytes32) {
        return shopOwners[shopOwnerId].productList[row];
    }
}
