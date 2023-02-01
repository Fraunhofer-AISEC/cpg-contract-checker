contract mapping2{
  mapping(uint=>string[]) public data;
           
  function insert(uint roll,string memory name) public returns(string memory) {
    data[roll].push(name);
  }

  function result(uint _roll) public view returns(string memory) {
    return data[_roll];
  }
}
