{

    ... 

    
    error IncorrectPrice(uint correctPrice);

    function pay(string memory _title) public payable {
        
        Movie storage requested_movie = movieInfo[_title];
    
        
        if (msg.value != requested_movie.price)
            revert InvalidPrice(requested_movie.price);

        
    }

   ... 
}
