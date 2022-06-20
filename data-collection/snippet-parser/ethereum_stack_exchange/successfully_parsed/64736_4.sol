pragma solidity ^0.5;

contract A  {

      mapping(address =>address[]) public inves;

      function totalInvesCount(address index) public view returns(uint){
        return(inves[index].length);
      }

}



contract B is A {

}
