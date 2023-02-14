contract Example {
    mapping(uint => Pool) public poolsByDay;
    mapping(uint => Pool) public poolsById;

    constructor(uint day) public {
        for (uint i = 1; i <= day; i++) {
            Pool memory pool = Pool({
                id: i,
                amount: 0
            });

            poolsByDay[i] = pool;
            poolsById[i] = pool; 
        }
    }

    function deposit(uint day, uint amount) external {
        Pool storage pool = poolsByDay[day];
        pool.amount += amount; 
    }
}
