pragma solidity >=0.4.21 <0.7.0;


contract SimpleStorage {
    string public data;
    event MyEvent(
        uint256 indexed id,
        uint256 indexed date,
        string indexed value
    );
    uint256 nextId;

    function setData(string calldata _data) external {
        data = _data;
        emit MyEvent(nextId, now, "Cazzo");
        nextId++;
    }

    function getData() external view returns (string memory) {
        return data;
    }
}
