contract test  {

    bytes32 private constant ownerSlot = keccak256("ownerSlot");
    
    constructor(address _implementation) public {
        bytes32 s = ownerSlot;
        assembly {
          sstore(s, _implementation)
        }
    }

}
