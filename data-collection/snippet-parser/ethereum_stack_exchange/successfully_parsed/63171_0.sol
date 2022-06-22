pragma solidity 0.5.0;

contract Shop {

    struct ShopOwner {
        string id;
        string[] productList;
    }

    struct Product {
        string id;
        string name;
    }

    mapping(string => ShopOwner) private mapShopOwner;

    function getUserProductList(string _shopOwnerId) public view returns(string[]) {
        return (mapShopOwner[_shopOwnerId].productList);
    }

}
