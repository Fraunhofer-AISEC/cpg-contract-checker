pragma solidity ^0.5.0;

contract Storage {
    struct Log {
        string fname;
        string lname;
        string dob;
    }
    mapping (uint => Log) logs;

    function set(uint memory index, string memory fname, string memory lname, string memory dob) public returns (uint) {
        index++;
        logs[index] = Log(fname, lname, dob);
        return (index);
    }

    function get(uint idx) public view returns (string memory, string memory, string memory) {
        return (logs[idx].fname, logs[idx].lname, logs[idx].dob);
    }
}
