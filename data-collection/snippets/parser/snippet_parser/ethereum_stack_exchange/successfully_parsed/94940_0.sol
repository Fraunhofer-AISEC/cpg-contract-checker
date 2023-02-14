address private Manager;

string public Question;

string public winnerGroup;

mapping(address => string) userGroup;

mapping(address => uint) payment;




constructor(string memory _Question) {
    Manager == msg.sender;
    Question = _Question;
}


modifier onlyManager() {
    require(msg.sender == Manager);
    _;
}

struct group_A {
    address[] addresses;
    uint totalFund;
    uint userCount;
    uint profitPerUser;
}

struct group_B {
    address[] addresses;
    uint totalFund;
    uint userCount;
    uint profitPerUser;
}







function pickAnswerA() public payable {
    group_A.addresses.push(msg.sender);
    payment[msg.sender] += msg.value;
    group_A.totalFund = msg.value;
    group_A.userCount += 1;
    userGroup[msg.sender] == "A";
}

function pickAnswerB() public payable {
    group_B.addresses.push(msg.sender);
    payment[msg.sender] += msg.value;
    group_B.totalFund += msg.value;
    group_B.userCount += 1;
    userGroup[msg.sender] == "B";
}
