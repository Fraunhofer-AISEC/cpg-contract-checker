pragma solidity ^0.5.0;

contract Auction{

struct Product{
    string name;
    string description;
    uint time;
}


uint topMoney;


mapping (uint => address) productToOwner;

mapping (uint => address) topMoneyOwner;




event Listed(uint id, string name, uint itme);

Product[] public products;


function listUp(string memory _name, string memory _description) public {
    
    uint time = now + 1 minutes;
    
    uint id = products.push(Product(_name, _description, time)) - 1;
    
    topMoney=0;
    
    productToOwner[id] = msg.sender;
    emit Listed(id, _name, time);
}


function bidOn() payable public {
    if ( topMoney < msg.value){            
        topMoney = msg.value;   
        topMoneyOwner[topMoney] = msg.sender;         
    } else {
        msg.sender.transfer(msg.value);
    }

}


function _end(uint _id) private view returns (bool) {
    require(now >= products[_id].time);
        return true;             
}


function winner(uint _id)  public  {
    require( true == _end(_id));
    address(uint160(productToOwner[_id])).transfer(topMoney);
    productToOwner[_id] = topMoneyOwner[topMoney];
}   
}
