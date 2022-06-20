contract Price {
    event PriceChanged(uint price);
    function logPrice(uint price) public {
       emit PriceChanged(price);
    }
}
