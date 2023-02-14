    
    function listNewProduct(
        address _seller,
        uint256 _price,
        uint256 _rating,
        string memory _name,
        string memory _description,
        string memory _category,
        string memory _imgUrl
    ) public {
        require(checkUserExists(msg.sender) == true, "Accounts need to be created");
        require(storeExist == true, "you need to own a store to list products");
        require(msg.sender == _seller , "you need to be a seller");
        Product memory newProduct = Product({
            buyer: address(0),
            seller: msg.sender,
            id: productCounter,
            price: _price,
            rating: _rating,
            name: _name,
            description: _description,
            category: _category,
            imgUrl: _imgUrl
        });

        product[productCounter] = newProduct;
        productCounter++;
        products.push(newProduct);
    }
