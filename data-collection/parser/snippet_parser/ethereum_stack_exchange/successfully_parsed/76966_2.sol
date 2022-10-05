pragma solidity 0.5.8;

contract Increment {

    uint epoch;

    mapping(bytes32 => Contract) private contracts; 

    bytes32[] public idList;
    struct Contract { 
            uint data;
            uint vintage;
    }

    function newContract(bytes32 id, uint data, uint vintage) public {
        idList.push(id); 
        Contract storage c = contracts[id];
        c.data = data;
        c.vintage = vintage;
    }


    function setEpoch(uint e) public {
        epoch = e;
    }

    function getContract(uint row) public view returns(bytes32 id, uint data, uint age) {
        require(row <= idList.length);
        id = idList[row];
        Contract storage c = contracts[id];
        data = c.data;
        age = epoch - c.vintage; 
    }
}
