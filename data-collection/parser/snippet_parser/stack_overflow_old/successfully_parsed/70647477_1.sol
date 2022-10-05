  
  
  function getPostsByUser(
    address _user,
    uint256 _page,
    uint256 _perPage
  )
    external
    view
    onlyValidPostPage(_page)
    onlyValidPostPerPage(_perPage)
    returns (PostStruct[] memory)
  {
    uint256[] memory allPostIds = postIndexesByUser[_user];
    PostStruct[] memory result = new PostStruct[](_perPage);
    uint256 index = 0;

    require(
      _page * _perPage - _perPage < allPostIds.length,
      "There is no data to display."
    );

    for (uint256 i = _perPage * _page - _perPage; i < _perPage * _page; i++) {
      if (i < allPostIds.length) {
        result[index] = posts[allPostIds[i]];
        index++;
      }
    }
    return result;
  }
