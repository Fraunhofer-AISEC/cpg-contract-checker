pragma solidity ^0.4.8;
library ReceiptLib {
  struct Interval { 
    uint32 num;
    int32  core;
    uint32 next; 
  }

  struct intervalNode {
    uint32 den;       
    mapping(uint32 => Interval) list_;
    uint32 len;    
    uint32 head; 
    int32 coreLimit;
  }
  function constructReceipt(intervalNode storage self){ 
    self.head      = 1; 
    self.coreLimit = 128;

    self.list_[0] = Interval( { num: 0, core: 0, next: 0 });
    self.list_[1] = Interval( { num: 0, core: 0, next: 0 });
    self.len = 2;
  }
  function number(intervalNode storage self, uint32 s, uint32 e, int32 c){        
    uint32   selfSize = self.len;
    
    

    self.list_[selfSize]     = Interval( { num: e - 1, core: c, next: self.head  });
    self.list_[3]     = Interval( { num: 10, core: 10, next: 10 });
  }
}

contract Array{
  using ReceiptLib for ReceiptLib.intervalNode;
  ReceiptLib.intervalNode receiptList;

  function Array(){
    receiptList.constructReceipt();
  }
  function test(uint32 s, uint32 e, int32 c) {
    receiptList.number(s, e, c);
  }
}
