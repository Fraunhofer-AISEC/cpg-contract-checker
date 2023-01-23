

pragma solidity ^ 0.8.10; 

contract Rating { 

    mapping (bytes32 => uint8) public ratingsReceived;

    bytes32 [] public movieList; 
    
    constructor Rating(bytes32[]movieNames) public { 
        movieList = movieNames;
    }
    function totalVotesFor(bytes32 movie) view public returns (uint8) {
        return ratingsReceived[movie]; 
    } 

    function voteForMovie(bytes32 movie) public { 
        ratingsReceived[movie];
    }
}
