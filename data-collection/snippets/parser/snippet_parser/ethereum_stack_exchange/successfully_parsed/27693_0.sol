pragma solidity^0.4.16;

contract Test {

    struct SomeData {
        address[] users;
    }

    address[] nullArray;
    mapping(uint => SomeData) SomeDataList;

    function insertData(uint number) {
        SomeDataList[number] = SomeData({
            users : nullArray
        });

        SomeDataList[number].users.push(msg.sender);
    }

}
