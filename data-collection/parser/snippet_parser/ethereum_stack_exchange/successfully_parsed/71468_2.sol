contract MetaCoint {
    uint public index;
    mapping(uint => uint) public counters;

    function addCounter() external {
        index++;
    }

    function incCounter(uint _index) external {
        require(_index < index, "counter was not created");
        counters[_index]++;
    }
}
