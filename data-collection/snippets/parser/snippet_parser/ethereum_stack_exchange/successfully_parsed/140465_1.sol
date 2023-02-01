uint256 price;

function setPrice(uint256 foo) external onlyOwner{
  price = foo;
}

function mint(uint256 id, uint256 amount) external payable {
  require(msg.value == price, "invalid paid amount");
  _safeMint(id,amount);
}
