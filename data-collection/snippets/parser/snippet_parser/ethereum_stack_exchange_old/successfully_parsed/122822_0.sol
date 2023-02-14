contract MyContract is ERC721 {
    uint256 public counter;
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        
        counter = 0;
    }
    function myMethod(string memory _arg) public {
        
        counter++;
    }
}
