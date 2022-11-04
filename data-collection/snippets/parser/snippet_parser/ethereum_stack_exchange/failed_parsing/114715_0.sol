contract C {
    struct Product { uint price }
    Product[] storage products;

    function doSomething() {
        products.push(Product({price: 100}));
        products.push(Product({price: 200}));
        products[0] = products[1];
        products[1].price = 300;
    }
}
