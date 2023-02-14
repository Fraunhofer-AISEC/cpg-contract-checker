productStuct memory newProduct = productStuct({
        buyer: address(0),
        seller: msg.sender,
        id: products,
        name: _name,
        category: _category,
        description: _description,
        price: _price,
        rating: _rating
    });
    products[++productCounter] = newProduct
