contract Store {

    mapping(uint256 => uint256) public totalamt;

    function append(uint256 id,uint price) payable public {

        totalamt[id] = totalamt[id] + price;

    }
}
