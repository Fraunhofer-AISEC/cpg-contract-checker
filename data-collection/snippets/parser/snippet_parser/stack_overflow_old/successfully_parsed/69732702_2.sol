function notUpdatePost(uint256 _postIndex, uint256 _newCategory) external {
    
    
    RegularPost memory post = RegularPostArray[_postIndex];
    post.category = _newCategory;
}
