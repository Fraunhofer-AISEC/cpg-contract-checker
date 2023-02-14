pragma solidity >=0.4.21 <0.7.0;


contract Storage {
    bytes32 public data;
    event MyEvent(
        uint256 indexed id,
        uint256 indexed date,
        bytes32 indexed value
    );
    uint256 nextId;

    function setData(bytes32 _data) external {
        data = _data;
        emit MyEvent(nextId, now, _data);
        nextId++;
    }

    function getData() external view returns (bytes32) {
        return data;
    }
}
