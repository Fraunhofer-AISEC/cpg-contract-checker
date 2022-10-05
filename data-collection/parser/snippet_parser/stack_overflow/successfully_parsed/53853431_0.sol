 pragma solidity ^0.5.0;

contract UPChain  {
    address payable public owner;
    address payable public buyerAd;
    uint private price;
    Order private order;
    mapping(uint => Product) offeredProducts;
    uint private productseq;
    uint private orderedProductseq;

   struct Product{
       string productName;
       uint productPrice;
   }
   struct Order{
       uint orderNo;
       mapping(uint => Product) products;
   }

    modifier ownerMod  {
        require(owner == msg.sender);
        _;
    }
    modifier buyerMod {
        require(buyerAd == msg.sender);
        _;
    }
    function () external payable {
     buyerAd.transfer(msg.value);
    }

    constructor (address payable _buyerAd) public payable  {
        buyerAd = _buyerAd;
        order = Order(1);
        owner = msg.sender;
    }
    function addProduct(string memory _productName,uint _productPrice) public ownerMod{
        offeredProducts[productseq] = Product(_productName,_productPrice);
        productseq++;
    }
    function queryProduct(uint _productseq) public view returns(string memory, uint){

       return (offeredProducts[_productseq].productName,offeredProducts[_productseq].productPrice);
    }


    
    function addtoOrder(uint _productseq) public buyerMod{
        order.products[orderedProductseq] = offeredProducts[_productseq];
        orderedProductseq++;
    }

    function queryOrderedProduct(uint _orderedProductseq) public view buyerMod returns(string memory,uint){
        return(order.products[_orderedProductseq].productName,order.products[_orderedProductseq].productPrice);
    } 

    function completeOrder() public payable buyerMod returns(string memory,uint){
        uint totalPrice=0;
        for(uint i=0; i<orderedProductseq;i++){
            totalPrice+= order.products[i].productPrice*1000000000000000000;
        }
        if(msg.value > totalPrice){
            owner.transfer(msg.value);
            return ("Order is completed", buyerAd.balance);
        }
        else{
            revert();
            return ("Order is not completed", buyerAd.balance);

        }
    }




    

    function sendtoOwner(uint256 value) public payable buyerMod{
        owner.transfer(value);
    }


    function setPrice(uint _price) public ownerMod {
        price = _price;
    }

    function getPrice() public view returns(uint)  {
        return price;
    }
    function getContractValue() public  payable returns(uint){
        return owner.balance;

    }


}
