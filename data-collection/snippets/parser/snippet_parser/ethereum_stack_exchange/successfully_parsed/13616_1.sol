contract ProductList {
    address productAddr;
    string p_name;
    uint p_id;
    Product p;
    function ProductList(address addr) {
        productAddr = addr;
        p = Product(addr);
    }

    function readProduct (uint u) returns (bool c) {
      p_id = p.products[u].id;
      p_name = p.products[u].name;
      c = true;
    }
}
