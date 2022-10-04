function getProduct(uint id) constant returns (uint , string name, uint price, string description, uint quantity, bool enabled){
    return (
      id,
      products[id].name,
      products[id].price,
      products[id].desc,
      products[id].quantity,
      products[id].enabled
    );
  }
