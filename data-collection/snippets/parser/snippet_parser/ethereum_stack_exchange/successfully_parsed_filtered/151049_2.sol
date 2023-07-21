


pragma solidity ^0.8.0;

contract PersonContract {
    struct Person {
        string firstName;
        string lastName;
        uint8 age;
        uint256 favNumber;
    }

    
    function getPersonA(
        string memory first,
        string memory last,
        uint256 fav
    ) public pure returns (Person memory) {
        return Person(first, last, 100, fav);
    }

    
    function getPersonB(
        string memory first,
        string memory last,
        uint256 fav
    )
        public
        pure
        returns (
            string memory,
            string memory,
            uint8,
            uint256
        )
    {
        return (first, last, 100, fav);
    }
}

