    function buyItem(uint _forSaleID) public payable{
        Items storage _itembought = item[_forSaleID];
        ItemsForSale memory _itemSale = sales[_forSaleID];
        require(_itemSale.productPrice == msg.value, "Product costs more");
        payable(_itembought.productOwner).transfer(_itemSale.productPrice);

        _itembought.productOwner = msg.sender;
    }
