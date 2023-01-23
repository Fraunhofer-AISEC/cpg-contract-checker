function updatePost(uint256 _postIndex, uint256 _newCategory) external {
    
    
    RegularPost storage post = RegularPostArray[_postIndex];
    post.category = _newCategory;
}
