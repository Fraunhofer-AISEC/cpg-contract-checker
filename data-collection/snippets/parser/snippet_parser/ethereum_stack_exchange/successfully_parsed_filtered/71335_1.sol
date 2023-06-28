pragma solidity >=0.4.21 <0.7.0;

contract Transfer {
    uint256 public idCounter;
    mapping(uint256 => address[]) public owners;
    event NewAsset(uint256 id);

    function createAsset() public {
        owners[idCounter].push(msg.sender);
        emit NewAsset(idCounter);
        idCounter++;
    }

    function transferProduct(uint256 id) public {
        owners[id].push(msg.sender);
    }
}
