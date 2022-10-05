

pragma solidity 0.8.7;

contract Imdb{
    struct Rating{
        address userAccount;
        string MovieName;
        uint8  ratings;
        string reviews;
    }
    
    Rating[] public Ratings;
    event showData(Rating[]);
    
    function AddRatings(address _userAccount, string memory _movieName, uint8 _ratings, string memory _reviews) public {
        require(_ratings <= 5, "Ratings cannot be greater than 5");

        Ratings.push(Rating({
            userAccount: _userAccount,
            MovieName: _movieName,
            ratings: _ratings,
            reviews: _reviews
        }));
        emit showData(Ratings);
    }


    function GetRatings_by_address(address _userAccount) public view returns(Rating[] memory){
        ***Rating[] memory tempRatings = new Rating[](Ratings.length);***

        for (uint i = 0; i < Ratings.length; i++) {
            
            if (Ratings[i].userAccount == _userAccount) {
                tempRatings[i].userAccount = _userAccount;
                tempRatings[i].MovieName = Ratings[i].MovieName;
                tempRatings[i].ratings = Ratings[i].ratings;
                tempRatings[i].reviews = Ratings[i].reviews;
            }
        
        }
        
        return tempRatings;

    }
}
