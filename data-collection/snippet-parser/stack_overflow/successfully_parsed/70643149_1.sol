contract Post {
  
  
  function createPost(PostInputStruct memory _input)
    external
    onlyValidInput(_input)
    returns (bool)
  {
    
    
  }
}
