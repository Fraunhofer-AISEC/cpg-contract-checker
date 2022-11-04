
  pragma solidity ^0.8.0;

  import './IERC165.sol'; 

  contract ERC165 is IERC165 {

    mapping (bytes4 => bool) private _supportedInterfaces;

    constructor() {
      _registerInterface(bytes4(keccak256('supportsInterface(bytes4)'))); 
    }

    function supportsInterface(bytes4 interfaceID) external view returns (bool) {
      return _supportedInterfaces[interfaceID];
    }

    function _registerInterface(bytes4 interfaceId) internal{
      require(interfaceId != 0xfffffff, 'Invalid interface request');
      _supportedInterfaces[interfaceId] = true;
    }
  }
