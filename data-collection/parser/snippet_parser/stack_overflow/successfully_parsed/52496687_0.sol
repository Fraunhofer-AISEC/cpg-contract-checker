  function buyItem(uint _no, address[] _sigs, uint _amount) public payable {
    Product storage productIndex = productsArray[_no];
    Seller storage productSeller = sellers[productIndex.oneSeller];
    address buyer = msg.sender;
    address seller = productSeller.sellerAddress;
    uint amount = _amount;
    bytes32 transactionHash = keccak256(abi.encodePacked(buyer, seller, amount, _sigs));
    txHash.push(transactionHash);

    require(msg.sender != 0);
    require(msg.sender != productSeller.sellerAddress, "Buyer address is same as Seller Address");
    require(amount >= productIndex.price);
    require(productIndex.inStock);

    escrow.createTransaction(buyer, seller, transactionHash, _sigs, amount);
    

    productIndex.quantity--;
  } 
