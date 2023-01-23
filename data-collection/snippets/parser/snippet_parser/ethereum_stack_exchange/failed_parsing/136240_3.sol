
pragma solidity 0.8.16;

type UserId is uint256;
type UFixed is uint256;


library FixedMath {
    uint constant multiplier = 10**18;

    
    
    function add(UFixed a, UFixed b) internal pure returns (UFixed) {
        return UFixed.wrap(UFixed.unwrap(a) + UFixed.unwrap(b));
    }
    
    
    function mul(UFixed a, uint256 b) internal pure returns (UFixed) {
        return UFixed.wrap(UFixed.unwrap(a) * b);
    }
    
    
    function floor(UFixed a) internal pure returns (uint256) {
        return UFixed.unwrap(a) / multiplier;
    }
    
    
    function toUFixed(uint256 a) internal pure returns (UFixed) {
        return UFixed.wrap(a * multiplier);
    }
}

contract Contract {
    using FixedMath for UFixed;

    mapping(UserId => User) public users;

    struct User {
        UserId id;
        string name;
    }

    function getUser(UserId userId) public view returns(User memory) {
        return users[userId];
    }

    function add(UFixed a, UFixed b) public pure returns(UFixed) {
        return a.add(b);
    }

}
