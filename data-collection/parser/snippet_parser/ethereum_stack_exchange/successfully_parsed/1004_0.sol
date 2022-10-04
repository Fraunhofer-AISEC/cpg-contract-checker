  contract smallMarket{

    struct transaction {
      uint timeStamp;
      uint qtyT;
      uint price;
      address client;
      bytes32 typee;
    }
    struct sellOrder {
      uint timeStamp;
      uint qty;
      uint price;
      address seller;
    }

    mapping(uint => transaction) public transactions;
    mapping(uint => sellOrder) public sellorders;

    uint public lastTransactionId;
    uint public lastBOrderId;
    uint public lastSOrderId;
    address public owner;

    function smallMarket(){
      owner = msg.sender;
      lastSOrderId = 0;
    }
    function newTransaction(uint amount,uint price,bytes32 typee){
      uint transac = lastTransactionId + 1;
      transaction t = transactions[transac];
      t.timeStamp = block.timestamp;
      t.qtyT = amount;
      t.price = price;
      t.client = msg.sender;
      t.typee = typee;
      lastTransactionId = transac; 
    }

    function newSellOrder(uint amount,uint price,uint currency) {
        uint order = lastSOrderId + 1; 
        sellOrder s = sellorders[order];
        s.timeStamp = block.timestamp;
        s.qty = amount;
        s.price = price;
        s.seller = msg.sender;
        lastSOrderId = order;
    }
    function buy(uint amount, uint price) {
      uint idCounter = lastSOrderId;
      uint _amountLeftToBuy = amount;
      while (_amountLeftToBuy > 0){
          if (price >= sellorders[idCounter].price && sellorders[idCounter].qty >= amount) {
            newTransaction(amount,price,'cas 1');
            _amountLeftToBuy = 0;

          }
          else if (price >= sellorders[idCounter].price && amount > sellorders[idCounter].qty ){
              newTransaction(amount,price,'cas 2');
              _amountLeftToBuy =  amount - sellorders[idCounter].qty;
              idCounter = idCounter - 1;
          }
          else if (sellorders[idCounter].price > price){
              newTransaction(amount,price,'cas 3');
              _amountLeftToBuy = 0;
          }
          else{}
      }    
    }
  }
