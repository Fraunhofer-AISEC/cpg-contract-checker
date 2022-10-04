function get(uint256 index) public view returns (bool, string memory) {
    Post memory post = posts[index];
    return (post.deleted, post.text)
}
