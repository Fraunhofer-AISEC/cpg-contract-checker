    function getProduct(address _address, uint index) view public returns(uint, bytes32, bytes32, uint, bytes10) {
        Product storage p = OwnerOfProducts[_address][index];
        return(p.id, p.name, p.serlialNo, p.price, p.pro_state); 
    }

    function getproductcount(address _address) view public returns(uint){
        return OwnerOfProducts[_address].length;
    }
