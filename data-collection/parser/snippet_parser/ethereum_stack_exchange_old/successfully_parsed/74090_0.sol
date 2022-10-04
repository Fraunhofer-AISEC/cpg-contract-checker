pragma solidity ^0.4.24;

contract online_shopping{

    struct item {
        uint price;
        string name;
        

    }
    struct soldItems{
        address customer;
        uint tprice;
    }

    mapping (address=>uint) sold;
    uint public number;
    uint public totalPrice;
    item  [] public items;
    
    uint public len;
    address public owner;
    constructor () public{
        owner=msg.sender;

    }
    modifier  onlyOwner() {
        require(msg.sender==owner);
        _;

    }

    function  addItems(uint _price,string _name) public onlyOwner  {

        items.push(item({
            price : _price,
            name : _name
           
        }));

    }
    function () payable public{}

    function  sellItems (uint _number,string _name)public payable returns(bool)
    {

        number=_number;
        bool f;
        uint p;

        len=items.length;
        for(uint i=0;i<items.length;i++)
        {
            if (keccak256(abi.encodePacked(items[i].name))==keccak256(abi.encodePacked(_name)))
            { f= true;p=i;}
            else
            {f=false;}
        }
        if(f==true)
        {
          totalPrice= items[p].price*number; 
        }

        if(msg.value>totalPrice)
        {
            address(this).transfer(totalPrice-msg.value);
            return true;
            sold[msg.sender]=totalPrice;
        }
        else
        {
            return false;
        }
    }  

}
