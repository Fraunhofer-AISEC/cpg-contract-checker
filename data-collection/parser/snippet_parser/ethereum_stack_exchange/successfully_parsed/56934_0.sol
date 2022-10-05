pragma solidity ^0.4.22;

contract SmartMsgData {
    
    event onDeposit(int128 id, address person, uint amount);

    function bytesToBytes16(bytes b, uint offset) private pure returns (bytes16) {
      bytes16 out;

      for (uint i = 0; i < 16; i++) {
        out |= bytes16(b[offset + i] & 0xFF) >> (i * 8);
      }
      return out;
    }

    function () payable external {
        require(msg.value > 0);
        require(msg.data.length == 16); 

        

        int128 id = int128(bytesToBytes16(msg.data, 0));
        address person = msg.sender;
        uint amount = msg.value;

        
        emit onDeposit(id, person, amount);
    }
}
