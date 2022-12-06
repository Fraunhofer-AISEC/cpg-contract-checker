
contract Shop {
  address owner;

  string name;
  string type;
  struct Product {
    string code;
    uint unitPrice;
  }
  mapping(string => Product) products;

  function placeOrder(string productCode, uint qty) {
    ....
  }
}



contract ShopRegistry {
  mapping(string => address) shops;

  function getShop(string name) returns (address) {
    return shops[name];
  }
}




var registry = ShopRegistry.at(registry_address);


var shopAddress = registry.getShop('EtherTShirtsRUs');


var etherTShirts = Shop.at(shopAddress);


etherTShirts.placeOrder(...);
