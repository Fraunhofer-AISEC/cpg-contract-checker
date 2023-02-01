pragma solidity 0.7.5;

pragma experimental ABIEncoderV2;

contract Test
{
    struct Candidate
    {
        string name;
        uint256 officeId;
        address candidateAddress;
        uint256 arrayIndex;
    }
    constructor()
    {
        aaa.name = "aaaa";
        aaa.officeId = 5;
        aaa.candidateAddress = 0x6666666666666666666666666666666666666666;
        aaa.arrayIndex = 7;
    }
    Candidate public aaa;
    function bbb() external view returns (string memory name, uint256 officeId, address candidateAddress, uint256 arrayIndex)
    {
        return (aaa.name, aaa.officeId, aaa.candidateAddress, aaa.arrayIndex);
    }
    function ccc() external view returns (Candidate memory)
    {
        return aaa;
    }
}
