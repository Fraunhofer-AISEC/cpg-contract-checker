
pragma solidity >=0.4.22 <0.9.0;

contract Trade {
    enum TradeState {
        Start,
        Proceeding,
        Shipping,
        Cancel,
        Complete,
        Return
    }
    
    address payable public seller;
    address payable public buyer;
    uint256 public productID; 
    uint256 public price;  
    uint256 public trackingNumber; 
    uint256 public depositAmount; 
    TradeState public currentTradeState; 

    constructor(address _buyer, uint256 _productID, uint256 _price) payable {
        seller = payable(msg.sender); 
        depositAmount = msg.value;
        buyer = payable(_buyer);
        productID = _productID;
        price = _price; 
        trackingNumber = 0; 
        currentTradeState = TradeState.Start; 
    }

    function setTrackingNumber(uint256 _trackingNumber) public {
        require(msg.sender == seller); 
        trackingNumber = _trackingNumber;
        currentTradeState = TradeState.Shipping; 
    }

    function makePayment() public payable returns (bool result) {
        require(msg.sender == buyer && msg.value == price, "Not enough ETH"); 
        currentTradeState = TradeState.Proceeding; 
        return true;
    }

    function completeTrade() public payable {
        require(msg.sender == buyer, "msg.sender is not buyer!"); 
        require(trackingNumber != 0, "trackingNumber has not been set.");

        seller.transfer(price + depositAmount); 

        if (address(this).balance > 0) {
            buyer.transfer(address(this).balance); 
        }
        currentTradeState = TradeState.Complete;
    }

    function cancel() public payable {
        require(currentTradeState != TradeState.Shipping, "Already shipped.");
        
        seller.transfer(depositAmount);
        if (address(this).balance > 0) {
            buyer.transfer(address(this).balance);
        }
        currentTradeState = TradeState.Cancel; 
    }

    function returnProduct() public payable {
        require(msg.sender == buyer, "caller must be buyer.");
        buyer.transfer(address(this).balance);
        currentTradeState = TradeState.Return;
    }

    function transferWithoutPayingFee(address payable addr, uint256 amount) internal {
        addr.transfer(amount);
    }

    
}

