contract test {
    struct Prodotto {
        string titolo;
        address owner_address;
    }
    Prodotto[] public prodotti;

    constructor() public {
        for (uint i = 0; i < 5; i++) {
            prodotti.push(Prodotto({
                titolo: 'one more',
                owner_address: address(i)
            }));
        }
    }

    function remove(uint index) public {
        for (uint i = index; i < prodotti.length-1; i++) {
            prodotti[i] = prodotti[i+1];
        }
        delete prodotti[prodotti.length-1];
        prodotti.length--;
    }

    function check() public view returns(uint256) { return prodotti.length; }
}
