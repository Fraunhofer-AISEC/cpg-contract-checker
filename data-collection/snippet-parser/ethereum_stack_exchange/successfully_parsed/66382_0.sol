pragma solidity 0.4.25;

contract MyContract {
    struct Record {
        bool valid;
        uint val1;
        uint val2;
        uint val3;
    }

    mapping(uint => Record) public table;

    uint public count;

    function insert(uint key, uint val1, uint val2, uint val3) external {
        Record storage record = table[key];
        if (record.valid == false) {
            record.valid = true;
            record.val1 = val1;
            record.val2 = val2;
            record.val3 = val3;
            count += 1;
        }
    }

    function storage_remove(uint[] keys) external {
        for (uint i = 0; i < keys.length; i++) {
            Record storage record = table[keys[i]];
            if (record.valid == true) {
                delete table[keys[i]];
                count -= 1;
            }
        }
    }

    function memory_remove(uint[] keys) external {
        for (uint i = 0; i < keys.length; i++) {
            Record memory record = table[keys[i]];
            if (record.valid == true) {
                delete table[keys[i]];
                count -= 1;
            }
        }
    }
}
