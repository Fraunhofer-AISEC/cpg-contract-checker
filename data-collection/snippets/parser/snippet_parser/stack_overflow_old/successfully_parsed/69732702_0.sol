pragma solidity >=0.7.0 <0.9.0;

contract Storage {

    struct RegularPost {
        uint256 category;
        string name; 
        string post;
        address addr;
        uint256 date;
    }
    
    RegularPost[] public RegularPostArray;

    function addNewPost(uint256 _category, string memory _name, string memory _post, uint256 _date) public {
        RegularPostArray.push(RegularPost({category: _category, name: _name, post: _post, addr: msg.sender, date: _date}));
    }    

    function getRegularPosts() public view returns (RegularPost[] memory) {
        return RegularPostArray;
    }
        
}
