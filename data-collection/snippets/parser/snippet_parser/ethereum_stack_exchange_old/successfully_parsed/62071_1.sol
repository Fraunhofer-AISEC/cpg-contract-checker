pragma solidity ^0.4.25;

contract StarNotary { 
    struct Star { 
        string name;
        string dec;
        string mag;
        string cent;
        string story;
    }

    Star[] public stars;

    function createStar(
        string _name,
        string _dec,
        string _mag,
        string _cent,
        string _story
    )
        public
        returns (uint256) 
    {
        Star memory newStar = Star(_name, _dec, _mag, _cent, _story);

        uint256 tokenId = stars.push(newStar) - 1;

        return tokenId;

    }
}
