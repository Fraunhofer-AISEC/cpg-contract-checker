contract Owned {
    address public owner;

    function Owned() {
        owner = msg.sender;
    }

    function transferOwnership(address newOwner) only_owner {
        owner = newOwner;
    }

    
    modifier only_owner {
      assert(msg.sender == owner);
      _;
    }
}
