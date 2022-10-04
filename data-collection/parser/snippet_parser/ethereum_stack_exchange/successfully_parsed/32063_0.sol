pragma solidity ^0.4.15;
contract Seller {
    uint public value;
    address public seller;
    string public sellername;
    string public selleraddress;
    string public productdescription;
    uint public perunitcost; 
    uint public productquantity;
    uint public updatedproductquantity;
    mapping (address => uint) public balances;

function Seller(string tokensellername,string tokenselleraddress, string tokenproductdescription, uint tokenproductquantity,uint tokenperunitcost) public {
        sellername = tokensellername;
        selleraddress = tokenselleraddress;
        productdescription = tokenproductdescription;
        productquantity = tokenproductquantity;
        perunitcost = tokenperunitcost;
    }

  function confirmPurchase(address _seller) payable {
    uint itemstoBuy = value / msg.value; 

  
    require(balances[_seller] >= itemstoBuy);

    balances[_seller] -= itemstoBuy;
    balances[msg.sender] += itemstoBuy;
    _seller.transfer(msg.value); 

    
    updatedproductquantity = balances[_seller];
  } 
}
