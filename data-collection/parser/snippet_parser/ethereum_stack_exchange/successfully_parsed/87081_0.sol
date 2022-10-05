pragma solidity >=0.5.0 <0.6.0;

contract EthereumOpinionRewards {

uint count = 0;

mapping (address => uint) private EthereumPoints;

mapping (address => Question[]) private a;
mapping (uint => Question[]) private b;

mapping (string => uint) private answers;

struct Question {
  string question;
  string[] options;
  uint limit;
  address[] participants;
}

function exchangeEther(uint amount) public {
  assert(msg.sender.balance >= amount);

  address(this).call.value(amount);
  EthereumPoints[msg.sender] = EthereumPoints[msg.sender] + amount;
}

function exchangeEthereumPoints(uint amount) public{
  assert(EthereumPoints[msg.sender] >= amount);

  msg.sender.call.value(amount);
  EthereumPoints[msg.sender] = EthereumPoints[msg.sender] - amount;
}

function createSurvey() public {
  count = count + 1;
  a[msg.sender] = new Question[](0);
  b[count] = a[msg.sender];
}

function addQuestion(string memory question, uint limit) public {
  assert(EthereumPoints[msg.sender] > a[msg.sender].length * 1000 * limit);
  assert(bytes(question).length > 0 && bytes(question).length < 500);

  a[msg.sender].push(Question(question, new string[](0), limit, new address[](0)));
}

function addOptions(uint x, string memory option) public {
  assert(x <= a[msg.sender].length);
  assert(bytes(option).length > 0 && bytes(option).length < 500);

  a[msg.sender][x].options.push(option);
}

function terminateSurvey() public {
  delete a[msg.sender];
}

function answerQuestion(uint x, uint y, uint response) public {
  answers[b[x][y].question] = response;
  b[x][y].participants.push(msg.sender);
}

function reward(uint x, uint y) public {
  for (y = 0; y < a[msg.sender][x].participants.length; y++) {
    EthereumPoints[msg.sender] = EthereumPoints[msg.sender] - 1000;
    EthereumPoints[a[msg.sender][x].participants[y]] = EthereumPoints[a[msg.sender][x].participants[y]] + 1000;
  }
}

}
