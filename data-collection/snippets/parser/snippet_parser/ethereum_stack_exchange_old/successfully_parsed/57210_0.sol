pragma solidity ^0.4.24;

contract StackSample {

    struct Sample {
        uint48 tm;
        uint56 tdn;
        uint56 ash;
        uint56 ndf;
        uint56 adf;
        uint56 cp;
        uint48 nitr;
        uint64 rfv;
        uint64 rfq;
        uint48 nel;
        uint40 grower;
    }

    mapping(uint56 => Sample) public samples;

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function setSample(uint56 _stackID, uint48 _tm, uint56 _tdn, uint56 _ash, uint56 _ndf, uint56 _adf, uint56 _cp, uint48 _nitr, uint64 _rfv, uint64 _rfq, uint48 _nel, uint40 _grower) onlyOwner public {

        Sample storage sample = samples[_stackID];

        sample.tm = _tm;
        sample.tdn = _tdn;
        sample.ash = _ash;
        sample.ndf = _ndf;
        sample.adf = _adf;
        sample.cp = _cp;
        sample.nitr = _nitr;
        sample.rfv = _rfv;
        sample.rfq = _rfq;
        sample.nel = _nel;
        sample.grower = _grower;
    }

    function getSample(uint56 _stackID) view public returns (uint48, uint56, uint56, uint56, uint56, uint56, uint48, uint64, uint64, uint48, uint40) {

        Sample storage sample = samples[_stackID];

        return (sample.tm, sample.tdn, sample.ash, sample.ndf, sample.adf, sample.cp, sample.nitr, sample.rfv, sample.rfq, sample.nel, sample.grower);
    }
}
