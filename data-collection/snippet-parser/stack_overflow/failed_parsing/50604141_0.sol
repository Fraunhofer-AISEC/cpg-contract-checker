pragma solidity ^0.4.18;

contract FundEth {

    mapping (uint => Project) _projects;

    struct Project {
        uint id;
        uint targetWei;
        uint targetBlock;
        uint balanceWei;
        string name;
        string description;
        bool payedOut;
    }

    function fund(uint projectId) public payable
    {
        _projects[projectId].balanceWei += msg.value;
    }

    function create(uint targetWei, uint blocks, string name, string description)
        public
        returns (uint)
    {
        Project memory p = Project({
            id: ++_indexCounter,
            targetWei: targetWei,
            targetBlock: block.number + blocks,
            balanceWei: 0,
            name: name,
            description: description,
            payedOut: false
        });

        _projects[p.id] = p;

        return p.id;
    }

    function getProjectName(uint projectId)
        public
        view
        returns (string)
    {
        return "FOO";
    }

    function getProjectBalance(uint projectId)
        public
        view
        returns (uint)
    {
        return 10000000;
    }

    ...
}
