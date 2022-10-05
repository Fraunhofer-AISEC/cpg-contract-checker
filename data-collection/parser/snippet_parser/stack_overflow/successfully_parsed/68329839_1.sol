pragma solidity 0.8.6;

contract Decentragram {
    string public name = "Decentragram";

    
    mapping(uint256 => Image) public images;
    mapping(string => uint256) public test;

    struct Image {
        uint256 id;
        string hashImg;
        string description;
        uint256 tipAmount;
        address payable author;
    }

    
    function uploadImage() public {
        images[1] = Image({
            id: 1,
            hashImg: "abcd",
            description: "description",
            tipAmount: 0,
            author: payable(address(0x0))
        });
    }

    function getImage(uint256 id) public view returns (Image memory) {
        Image memory img = images[id];
        return img;
    }
    
}
