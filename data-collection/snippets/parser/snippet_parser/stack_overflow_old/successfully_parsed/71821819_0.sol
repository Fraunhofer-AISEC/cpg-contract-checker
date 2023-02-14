pragma solidity >=0.5.0;


contract test111 {
    struct Goods {
        bytes name;
        bytes img;
        bool isClaim;
    }

Goods public good = Goods("123","zx", false);
Goods[] public goodsList;

function getValue() public view returns(bytes memory) { 
    return good.img;
}

function add() public{
    goodsList.push(Goods("123","zx", false)); 
}

function getArray() public view returns(Goods memory){ 
   return goodsList[0]; 
}

function getLength() public view returns(uint) {
    return goodsList.length; 
}
}
