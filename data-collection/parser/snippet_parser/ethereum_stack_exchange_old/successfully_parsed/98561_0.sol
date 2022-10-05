

pragma solidity >=0.8.0 <0.9.0;

import './ClientBase.sol';
import './ClientETH.sol';
import '@openzeppelin/contracts/proxy/Clones.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract ClientFactory is Ownable  {
    address immutable public cbImplementation; 
    address immutable public ceImplementation; 

    constructor(address _cbImplementation, address  _ceImplementation)  {

        cbImplementation = _cbImplementation;
        ceImplementation = _ceImplementation;

    }

 function createClientBase(string[2] calldata uuids, uint[2] calldata target_info, uint[2] calldata vote_costraints,uint [2] calldata evaluation_info)
 external onlyOwner() returns (address) {
        address clone = Clones.clone(cbImplementation);
        address[] memory addresses= new address[](3);
        addresses[0]= msg.sender;
        addresses[1]= msg.sender;
        addresses[2]= msg.sender;
        ClientBase(clone).initialize(addresses, uuids, target_info, vote_costraints, evaluation_info);
        return clone;
    }

        function createClientETH(string[2] calldata uuids, uint[2] calldata target_info, uint[2] calldata vote_costraints,uint [2] calldata evaluation_info ,uint256 _reward,address receiver_addr)
         external onlyOwner() returns (address) {
        address payable clone = payable(Clones.clone(ceImplementation));
        address[] memory addresses= new address[](4);
        addresses[0]= msg.sender;
        addresses[1]= msg.sender;
        addresses[2]= msg.sender;
        addresses[3]= receiver_addr ;
        ClientETH(clone).initialize(addresses, uuids, target_info, vote_costraints, evaluation_info, _reward);
        return clone;
    }
}
