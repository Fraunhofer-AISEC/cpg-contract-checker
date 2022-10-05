function paginateAllZombies(uint _resultsPerPage, uint _page) external view returns (Zombie[]) {
  uint[] memory result = new uint[](_resultsPerPage);
  for(uint i = _resultsPerPage * _page - _resultsPerPage; i < _resultsPerPage * _page; i++ ){
      result[i] = zombies[i];
    } 
    return result;
}
