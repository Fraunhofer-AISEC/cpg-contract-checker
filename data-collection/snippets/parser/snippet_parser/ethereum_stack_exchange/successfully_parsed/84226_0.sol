contract GraphTraversal {
    using HitchensUnorderedAddressSetLib for HitchensUnorderedAddressSetLib.Set;
    using HitchensUnorderedKeySetLib for HitchensUnorderedKeySetLib.Set;

    struct User {
        uint256 balance;
        uint256[] incomingStreamIds;
        mapping(uint256 => uint256) incomingStreamIdPointers; 
        uint256[] outgoingStreamIds;
        mapping(uint256 => uint256) outgoingStreamIdPointers; 
    }

    mapping(address => User) public users;
    HitchensUnorderedAddressSetLib.Set userSet;

    struct Stream {
        uint256 interval;
        uint256 paymentRate;
        address sender; 
        address recipient; 
        uint256 startTime;
        uint256 stopTime;
    }

    mapping(bytes32 => Stream) public streams;
    HitchensUnorderedKeySetLib.Set streamSet;
}
