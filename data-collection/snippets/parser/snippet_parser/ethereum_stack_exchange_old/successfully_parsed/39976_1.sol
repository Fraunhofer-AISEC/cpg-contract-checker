pragma solidity ^0.4.19;
contract Adoption {
    struct Pet {
        address owner;
        uint256 price;
    }

    Pet[16] data;

    function Adoption() public {
        for (uint i = 0; i < 16; i++) {
            data[i].owner = msg.sender;
            data[i].price = i;
        }
    }

    function getAdopters() external view returns (address[],uint256[]) {
        address[] memory owners = new address[](16);
        uint256[] memory prices =  new uint256[](16);
        for (uint i = 0; i < 16; i++) {
            owners[i] = (data[i].owner);
            prices[i] = (data[i].price);
        }
        return (owners,prices);
    }
}
