
pragma solidity ^0.8.0;

interface ITokens {
    struct Video {
        uint id;
        string URI;
        uint256 price;
        uint256 views;
        uint256 likes;
        uint256 dislikes;
        uint256 shares;
        uint256 comments;
        uint256 total;
        uint256 timestamp;
    }

function getVideo(uint _id) external view returns (Video memory);


function createAd(string memory _uri,address receiver) external payable;
}
