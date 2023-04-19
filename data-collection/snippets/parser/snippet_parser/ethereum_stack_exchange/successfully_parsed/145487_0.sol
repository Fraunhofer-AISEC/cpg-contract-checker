
pragma solidity ^0.8.17;

contract Birth {
    mapping(uint256 => bool) public isValidBirthCerti;

    function birthCertiGenerator(
        string memory _Name

    ) public returns (uint256) {
        uint256 birthCerti = uint256(
            keccak256(
                abi.encodePacked(
                    _Name
                )
            )
        ) % 100000000000000000;
        isValidBirthCerti[birthCerti] = true; 
        return birthCerti;
    }
}
