pragma solidity ^0.8.7;

interface IERC165 {

    
    

    
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}

contract ERC165 is IERC165 {

    

    function calcFingerPrint() public view returns(bytes4) {
        return bytes4(keccak256('supportedInterface(bytes4)'));
    }

    
    mapping(bytes => bool) private _supportedInterfaces;


     function supportsInterface(bytes4 interfaceId) external override view returns (bool) {
         _supportedInterfaces[interfaceId];
     }



    

} ```
