pragma solidity ^0.4.21;


import "./_dbs2.sol";


contract FundingAggrement {
uint recivered_amonunt;
uint amonunt;
uint[] a;
address owner;  

function validityCheck() public view returns(uint) {
    owner = msg.sender;
    Interface_gd gd = Interface_gd();
    a = require(gd.get(owner));
    require(a[0] == 1 || a[0] == 2);
    if(a[0] == 1) {
       require(a[1]<=50000);
    }
    if(a[0] == 2) {
       require(a[1]<=120000);
    }
    return a[0];
}

function aws(string _product_id, uint _ant) public view returns(uint) {
    uint amount;
    uint[] b;
    b = validityCheck();
    if(a[0] == 2) {
      if(_product_id == 'Fuel') {
        amount = _ant * (45/100);
      }
      if(_product_id == 'Food') {
        amount = _ant * (45/100);
      }
    }
    if(a[0] == 1) {
       if(_product_id == 'Fuel') {
        amount = _ant * (50/100);
      }
      if(_product_id == 'Food') {
        amount = _ant * (50/100);
      }
      if(_product_id == 'Electricity') {
        amount = _ant * (45/100);
      }
    }
    return amount;
}

function getRefund(string _product_id) public returns(bool success){
    recivered_amonunt == msg.value;
    amount = aws(_product_id, recivered_amonunt);
    msg.sender.transfer(amount);
    return true;
}

function FundingAggrement(string _product_id) public returns(string){
    getRefund(_product_id);
    return 'Sccessfull Transfer';
}
}