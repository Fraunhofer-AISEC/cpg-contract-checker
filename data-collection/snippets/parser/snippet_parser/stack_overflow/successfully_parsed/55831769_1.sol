pragma solidity >=0.4.22 <0.6.0;
contract Array {

string[] public flightsRegistered;


function getFlightsRegistered(uint _index) public view returns(string memory){
  return flightsRegistered[_index];
}

function totalFlightsRegistered() public view returns (uint ){
    return flightsRegistered.length;
}
}
