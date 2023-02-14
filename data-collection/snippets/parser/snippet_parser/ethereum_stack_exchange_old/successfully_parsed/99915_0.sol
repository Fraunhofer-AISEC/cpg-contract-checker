function getPostComments(address payable poster, string memory datePosted, string memory content, string memory localGroup, string memory majorGroup, string memory superiorGroup) public view returns (Post[] memory) {
        uint indexOfWateringHole = uint(findWateringHole(localGroup, majorGroup, superiorGroup));
        uint indexOfPost = uint(findPost(poster, datePosted, content,localGroup, majorGroup, superiorGroup));
        Post[] memory temp  = __posts[indexOfWateringHole][indexOfPost];
        return __posts[indexOfWateringHole][indexOfPost];
    }
