contract Test {  
    struct Product {  
        uint p_id,  
        uint qty
    }

    mapping(bytes32 => Product) ProdMap;

    function registerProduct (bytes32 id, uint p, uint q) returns (bool) {
        ProdMap[id].p_id = p;
        ProdMap[id].qty = q;
    }
}  
