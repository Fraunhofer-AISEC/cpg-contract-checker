function cancat(string memory a, string memory b) public view returns(string memory){
        return(string(abi.encodePacked(a,"/",b)));
    }
