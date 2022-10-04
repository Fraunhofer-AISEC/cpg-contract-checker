pragma solidity ^0.8.0; pragma experimental ABIEncoderV2;
contract ENStest {
    
    address public ENSReverseLookupContractAddr = address(0x196eC7109e127A353B709a20da25052617295F6f); 
    
    function addrToENS(address addr) public view returns(string[] memory) {
        ReverseRecords ens = ReverseRecords(ENSReverseLookupContractAddr);
        return ens.getNames([addr]);
    }
}
    

abstract contract ReverseRecords {
    function getNames(address[] calldata addresses) external view virtual returns (string[] memory r);
}
