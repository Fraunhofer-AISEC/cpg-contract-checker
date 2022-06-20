contract FirstContract is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter public _id;
    address payable _admin;

    constructor(address admin) ERC721("Token Name", "TOKEN") {
        _admin = payable(admin);
    }

    function incrementToken() public {
        _id.increment();
    }
}
