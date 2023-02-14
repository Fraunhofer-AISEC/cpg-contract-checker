
pragma solidity >=0.4.22 <0.9.0;

contract NegotiationMarketPlace {
    
    uint8 private buyerCount;
    uint8 private sellerCount;
    
    mapping (address => uint) private bidPrice;
    mapping (address => uint) private bidQuantity;
    mapping (address => uint) private bidWeight;
    mapping (address => uint) public agentType;
    
    address payable public dsoAgent;
    
    address[] public agentsList;
    
    uint public marketEndTime; 

    
    event LogBidMade(address indexed accountAddress, uint price, uint quantity, uint Weight); 

    
    bool ended;

    
    modifier onlyOperator() {
        require(
            msg.sender == dsoAgent,
            "Only DSO/Operator can call this."
        );
        _;
    }

    
    constructor() payable {
       
        
        dsoAgent = payable(msg.sender);
        
        buyerCount = 0;
        sellerCount = 0;
    }

    
    function submitBid(uint _bidprice, uint _bidquantity, uint _bidweight, uint _agenttype) public returns (uint) {
        if (_agenttype == 1) {
            buyerCount++;}
        else  {
            sellerCount++;
        }
        
        bidPrice[msg.sender] = _bidprice;
        bidQuantity[msg.sender] = _bidquantity;
        bidWeight[msg.sender] = _bidweight;
        agentType[msg.sender] = _agenttype;

        return agentType[msg.sender];
    }




    function retrievebid(address agentaddress) onlyOperator public view returns(uint[4] memory) {
        uint[4] memory array;
        if (bidPrice[agentaddress] != 0){
            array = [bidPrice[agentaddress], bidQuantity[agentaddress],bidWeight[agentaddress],agentType[agentaddress]];
        }
            return array;
    }


}












