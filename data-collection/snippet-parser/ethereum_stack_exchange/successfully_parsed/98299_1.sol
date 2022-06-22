function get(uint256 index) public view returns (string memory) {
    Post memory post = posts[index];
    required(post.isDeleted == false, "This post is deleted.")
    return post.text
}
