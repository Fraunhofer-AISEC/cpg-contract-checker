contract MyToken is ERC20, Ownable {   
    string public processNumber = "0041518-41.1982.8.26.0053";
    string public legalBinding = "a lot, a lot of verbiage would go here";
    

    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 9000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
    
  function setProcessNumber (string memory v) public onlyOwner() {
    processNumber = v;
  }

  function setLegalBinding (string memory v) public onlyOwner() {
    legalBinding = v;
  }

}
