
pragma solidity ^0.8.0;

import "./ContractA.sol";

contract ContractC is AccessControl {

    using Counters for Counters.Counter;
    Counters.Counter private _contractIds;
       
    ContractA[] merchContractStorage;

    mapping(string => uint256[]) artistToContract;
    mapping(string => address) artistToWallett;

    function addMerchContract(ContractA  _merch, string memory _artistName, address _wallett) public {
        uint256 contractId  = _contractIds.current() + 1;
        string memory artistName = _artistName;
        address artistWallett = _wallett;
        artistToWallett[artistName] = artistWallett;
        artistToContract[artistName].push(contractId);
        _contractIds.increment();
        merchContractStorage.push(_merch);
    }
}