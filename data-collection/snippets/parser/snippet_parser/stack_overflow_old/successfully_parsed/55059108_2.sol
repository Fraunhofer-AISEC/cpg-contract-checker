contract Example {
    mapping(uint => uint) public poolsByDay;
    mapping(uint => Pool) public poolsById;

    constructor(uint day) public {
        for (uint i = 1; i <= day; i++) {
            poolsById[i] = Pool({ id: i, amount: 0 });
            poolsByDay[i] = i;
        }
    }

    function deposit(uint day, uint amount) external {
        Pool storage pool = poolsById[poolsByDay[day]];
        pool.amount += amount; 
    }
}
