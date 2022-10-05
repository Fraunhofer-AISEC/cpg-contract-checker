  function getConstituency(uint _id) external view returns (uint, string memory, uint64[]) {
      return (constituencies[_id].id, constituencies[_id].name, constituencies[_id].cans);
  }
