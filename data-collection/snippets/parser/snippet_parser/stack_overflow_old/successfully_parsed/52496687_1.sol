pragma solidity ^0.4.25;

    contract Escrow {

      enum Status{FUNDED, RELEASED}

      struct Transaction {
        address seller;
        address buyer;
        uint value;
        uint lastFunded;
        bytes32 transactionHash;
        address[] signatures;
        Status status;
        mapping(address => bool) isOwner;
        mapping(address => bool) voted;
      }

      mapping(bytes32 => Transaction) public transactions;
      bytes32[] public transactionID;

      modifier onlyOwner(bytes32 _transactionHash) {
        require(msg.sender == transactions[_transactionHash].buyer);
        _;
      }


      function createTransaction(address _buyer, address _seller, bytes32 _transactionHash, address[] _signatures, uint _value) public payable {
        Transaction memory newTransaction = Transaction({
            buyer: _buyer,
            seller: _seller,
            value: _value,
            lastFunded: block.timestamp,
            transactionHash: _transactionHash,
            signatures: _signatures,
            status: Status.FUNDED
          });

        transactions[_transactionHash] = newTransaction;
        transactions[_transactionHash].isOwner[_seller] = true;
        transactions[_transactionHash].isOwner[_buyer] = true;
        transactionID.push(_transactionHash);
      }

      function addOwners(bytes32 _transactionHash) private {
        Transaction storage transaction = transactions[_transactionHash];
        for(uint i = 0; i < transaction.signatures.length; i++) {
          require(transaction.signatures[i] != 0);
          require(!transaction.isOwner[transaction.signatures[i]]);

          transaction.isOwner[transaction.signatures[i]] = true;
        }
      }

      function addFunds(bytes32 _transactionHash) public payable onlyOwner(_transactionHash) {
        uint _value = msg.value;
        require(_value > 0);

        
        transactions[_transactionHash].lastFunded = block.timestamp;
      }

      function transferFunds(bytes32 _transactionHash, uint _amount, address _destination) private returns(uint _valueTransferred) {
        Transaction storage transaction = transactions[_transactionHash];

        require(_amount > 0);
        require(_destination != address(0) && transaction.isOwner[_destination]);

        _valueTransferred = _amount;
        _destination.transfer(_amount);
      }

      function confirmHash(bytes32 _transactionHash) public view {
        require(_transactionHash != 0);
        bytes32 calculatedHash = getHash(_transactionHash);

        require(_transactionHash == calculatedHash);
      }

      function getHash(bytes32 _transactionHash) internal view returns(bytes32 hash) {
        Transaction storage transaction = transactions[_transactionHash];
        hash = keccak256(abi.encodePacked(transaction.buyer, transaction.seller, transaction.signatures, transaction.value));
      }

    }

    contract MarketPlace is Escrow{

      Escrow escrow;

    

      struct Product {
        string itemName;
        string color;
        string description;
        string warranty;
        string manufacturer;
        uint quantity;
        uint price;
        bool inStock;
        address oneSeller;
      }

    

      struct Seller {
        string sellerName;
        address sellerAddress;
        string sellerPhoneNumber;
        string sellerEmail;
        uint noOfProducts;
        mapping(uint => Product) products;
      }


      event AddedSeller(address seller, string sellerName, string sellerPhoneNumber, string sellerEmail);
      event AddedItem(address seller, string itemName, string color, string description, string warranty, string manufacturer, uint price, uint quantity);

    
    
    
    
    
    
    
    

      Seller[] public sellerList;
      Product[] public productsArray;

      address public owner;
      address[] public sellersAdd;

      bytes32[] public txHash;

      mapping(address => Seller) public sellers;
      mapping(address => bool) public isSeller;


    
      function MarketPlace() public {
        owner = msg.sender;
      }

    
    
    
    
    
    
    

      function addSeller(string _sellerName, string _sellerPhoneNumber, string _sellerEmail) public {
        require(!isSeller[msg.sender]);

        Seller memory newSeller = Seller({
          sellerName: _sellerName,
          sellerAddress: msg.sender,
          sellerPhoneNumber: _sellerPhoneNumber,
          sellerEmail: _sellerEmail,
          noOfProducts: 0
        });

        sellers[msg.sender] = newSeller;
        sellerList.push(newSeller);
        isSeller[msg.sender] = true;
        sellersAdd.push(msg.sender);

        emit AddedSeller(msg.sender, _sellerName, _sellerPhoneNumber, _sellerEmail);
      }

    
    
    
    
    
    
    

      function addItem(string _itemName, string _color, string _description, string _warranty, string _manufacturer, uint _price, uint _quantity) public {
        require(isSeller[msg.sender]);

        Product memory newProduct = Product({
          itemName: _itemName,
          color: _color,
          description: _description,
          warranty: _warranty,
          manufacturer: _manufacturer,
          price: _price,
          quantity: _quantity,
          inStock: true,
          oneSeller: msg.sender
        });

        uint itemNo = sellers[msg.sender].noOfProducts;
        sellers[msg.sender].products[itemNo] = newProduct;
        sellers[msg.sender].noOfProducts++;
        productsArray.push(newProduct);
        emit AddedItem(msg.sender, _itemName, _color, _description, _warranty, _manufacturer, _price, _quantity);
      }

    

      function getSellerCount() public view returns(uint) {
        return sellerList.length;
      }

    

      function getProductCount() public view returns(uint) {
        return productsArray.length;
      }

    

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
    }
