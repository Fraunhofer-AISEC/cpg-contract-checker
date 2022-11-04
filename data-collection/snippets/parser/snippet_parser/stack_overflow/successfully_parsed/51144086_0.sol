pragma solidity ^0.4.0;

contract Mortal {
   address owner;

   function Mortal() public { owner = msg.sender; }

   function kill() public { if (msg.sender == owner) selfdestruct(owner); }
}

contract Log is Mortal {
    bytes32[] id;

    function Log (string data) public Mortal(){
        id.push(sha256(abi.encodePacked(data)));
    }

    function mainId() public view returns (bytes32) {
        return id[0];
    }

    function check(string data) public view returns (bool){
        bytes32 d = sha256(abi.encodePacked(data));
        uint i = 0;
        bool enc = false;
        while(!enc && i < id.length){
            if(id[i] == d){
                enc = true;
            }
            i++;
        }

        return enc;
    }
    function add(string data) public {
        id.push(sha256(abi.encodePacked(data)));
    }
}
