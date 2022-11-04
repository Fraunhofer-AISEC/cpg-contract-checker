pragma solidity ^0.4.6;

contract Old {

  struct Thing {
    uint x;
    uint y;
  }

  Receiver r;

  function Old() {
    
    r = new Receiver();
  }

  
  
  function output() returns(bytes32[10] n, uint[10] a, uint sno, uint x, uint y) {
    

    Thing memory thing;
    thing.x = 1;
    thing.y = 2;
    return(n,a,sno,thing.x, thing.y); 
  }

  function getReceiver() returns(address receiver) {
    return r;
  }
}

contract Receiver {

  struct Thing {
    uint x;
    uint y;
  }

  address old;

  function Receiver() {
    old = msg.sender;
  }

  function pull() returns(bytes32[10] en, uint[10] ay, uint snow, uint ex, uint why) {
    Old o = Old(old); 
    Thing memory thing;
    bytes32[10] memory n;
    uint[10] memory a;
    uint sno;
    (n, a, sno, thing.x, thing.y) = o.output();
    return (n,a,sno,thing.x, thing.y);
    }
  }
