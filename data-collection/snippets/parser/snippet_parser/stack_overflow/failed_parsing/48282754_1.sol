struct Zombie {
  
};

Zombie[] public zombies;

function paginateAllZombies(uint _resultsPerPage, uint _page) external view returns (uint[]) {
  Zombie[] memory result = new Zombie[](_resultsPerPage);
  for(uint i = _resultsPerPage * _page - _resultsPerPage; i < _resultsPerPage * _page; i++ ){
      result[i] = i;
    } 
    return result;
}
