
     function fetchSellerProducts(address _seller) external view returns(Product[] memory) {
       Product[] memory sellerProducts = new Product[](productCounter);
       for(uint i = 0; i<productCounter; i++) {
          if(product[i].seller == _seller) {
              sellerProducts[i] = product[i];
          }
       }
       return sellerProducts;
    }
    
    
    function fetchSellerStore(address _creator) external view returns(Store[] memory) {
       Store[] memory sellerStore = new Store[](storeCounter);
       for(uint i = 0; i<storeCounter; i++) {
          if(store[i].creator == _creator) {
              sellerStore[i] = store[i];
          }
       }
       return sellerStore;
    }

    function getAllUserStoreAndProducts(address _pubkey) external view returns(Product[] memory, Store[] memory) {
           
    }
