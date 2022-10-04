
pragma solidity ^0.8.5;

contract MovieRatingApp{
    address owner;
    
    struct MovieDetail{
        bool flag;
        string directorName;
        string description;
        string cast;
    }

    
    struct MovieRating{
        bool   flag ;
        uint8[]  rating;
        bytes[] review;
        address[] users;
    }

    
    mapping (string => MovieDetail) MovieTracker;
    
    mapping (string => MovieRating[]) MovieRatings;
    
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner{
        require(owner == msg.sender);
        _;
    }

    function addMovie(string memory _movieName,
                      string memory _directorName,
                      string memory _description,
                      string memory _cast) public onlyOwner {
        MovieTracker[_movieName] = MovieDetail(true, _directorName, _description, _cast);
    }

    function addMovieRating(string memory _movieName,
                            uint8  _rating,
                            string memory _review)
                             public {
        MovieRatings[_movieName][0].flag = true; 
        MovieRatings[_movieName][0].rating.push(_rating); 
        MovieRatings[_movieName][0].review.push(bytes(_review));
        MovieRatings[_movieName][0].users.push(msg.sender);
    }



}
