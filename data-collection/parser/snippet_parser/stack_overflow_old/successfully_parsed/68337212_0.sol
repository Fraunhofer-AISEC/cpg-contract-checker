contract TheCondemned_Episode is ERC721Enumerable {

    string[] public episodes;
    

    constructor() ERC721("TheCondemned_e1", "TCe1") public {
    }

    function mint(string memory _episode) public {
       
        require(episodes.length <= 13, "Cannot make more than 13 episodes");
        episodes.push(_episode);
        uint _id= episodes.length;
        _mint(msg.sender, _id);
      
    }
}
