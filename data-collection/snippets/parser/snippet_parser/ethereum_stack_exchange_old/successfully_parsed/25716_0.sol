pragma solidity ^0.4.0;


contract addressRecord {
    struct  Record {
        address owner;
        uint score;
    }

    mapping (string => Record) records;
    string[] records_arr;

    function addDomain(string _domain, uint _score) {
        if (records[_domain].owner != address(0x0)
        && records[_domain].owner != msg.sender) { return; }

        records[_domain] = Record(msg.sender, _score);
        records_arr.length += 1;
        records_arr[records_arr.length-1] = _domain;
    }

    function getDomain(string _domain) constant returns(uint) {
        return records[_domain].score;
    }

    function changeScore(string _domain, address _to) {
        require(records[_domain].owner == msg.sender);
        records[_domain].owner = _to;
    }    

    function domainsCount() constant returns (uint) {
        return records_arr.length;
    }
}
