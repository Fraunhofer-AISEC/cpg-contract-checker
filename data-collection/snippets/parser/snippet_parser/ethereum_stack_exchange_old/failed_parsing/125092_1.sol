{

   ... 

    function pay(string memory _title) public payable {
        
        Movie storage requested_movie = movieInfo[_title];
    
        
        require(msg.value == requested_movie.price, "The price received is invalid");

        
    }

   ... 
}
