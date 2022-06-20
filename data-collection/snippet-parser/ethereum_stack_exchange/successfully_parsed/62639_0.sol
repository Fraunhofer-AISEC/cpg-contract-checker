pragma solidity 0.4.24;


contract ArraysExample {
   uint[] numbers;

   function addUser() public returns (uint[]) {
      numbers.push(random());
      return numbers;
   }

   function random() private view returns (uint8) {
      return uint8(uint256(keccak256(block.timestamp, block.difficulty))%251);
   }
}
