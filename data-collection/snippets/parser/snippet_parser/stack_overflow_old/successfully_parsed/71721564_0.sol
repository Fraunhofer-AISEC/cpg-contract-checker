    struct Product {
        uint id_prod;
        address owner_addr;
        uint curr_price;
        bool onSale;
    }

    struct Owner {
        uint id_owner;
        address payable addr;
    }

    
    receive() external payable {
    }

    
    function pay(address payable _to, uint amount) private {
        (bool sent, bytes memory data) = _to.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    function buyProduct(uint _id_product) external payable productOnSale(_id_product) buyerHasEnoughMoney(_id_product) alreadyOwner(_id_product){

        Owner storage _owner = getOwnerStruct(_id_product);
        Product storage _product = ProductList[_id_product];
        
        
        pay(payable(address(this)), 10**15);
        pay(_owner.addr, _product.curr_price);


        _product.owner_addr = msg.sender;
    }
