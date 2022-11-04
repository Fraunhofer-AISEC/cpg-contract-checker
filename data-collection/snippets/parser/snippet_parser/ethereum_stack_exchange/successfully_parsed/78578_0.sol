pragma solidity >=0.4.21 <0.6.0;




contract EqHunt {

  struct Equation {
    string repr;
    int answer;
    bool exists;
  }

  mapping(string => Equation) equations;
  mapping(string => address[]) public solvers;
  address payable private owner;

  uint256 public lastSolveTime;

  uint256 private delay;

  constructor() public payable {
    owner = msg.sender;
    lastSolveTime = now;
    delay = 10 minutes;
  }

  function locked() public view returns(bool) {
    if(now - lastSolveTime <= delay) {
      return true;
    } else {
      return false;
    }
  }

  function create(string memory _id, string memory _repr, int _answer) public {

    require(msg.sender == owner);

    require(!equations[_id].exists);

    Equation memory e = Equation(_repr, _answer, true);

    equations[_id] = e;

  }

  function getEquation(string memory _id) public view returns(string memory) {
    return equations[_id].repr;
  }

  function check(string memory _id, int _answer) internal view returns(bool) {

    require(equations[_id].exists);

    if(equations[_id].answer == _answer) {
      return true;
    } else {
      return false;
    }
  }

  function rand() internal view returns(uint256) {
    return uint256(uint256(keccak256(abi.encode(block.timestamp)))%10) + 1;
  }

  function payout() internal view returns(uint256) {
    return 40000000000000000/rand();
  }

  function reward(address payable _payee) internal {

    uint256 r = payout();

    require(address(this).balance>=r);

    require(now - lastSolveTime > delay);

    _payee.transfer(r);

    lastSolveTime = now;

  }

  function solve(string memory _id, int256 _answer) public payable {
    require(!hasSolved(_id));
    bool correct = check(_id, _answer);
    require(correct);
    if(correct) {
      addSolver(_id);
      reward(msg.sender);
    }
  }

  function addSolver(string memory _id) internal {
    solvers[_id].push(msg.sender);
  }

  function hasSolved(string memory _id) internal view returns(bool) {
    address[] memory _solvers = solvers[_id];
    for(uint256 i=0; i<_solvers.length; i++) {
      if(_solvers[i] == msg.sender) {
        return true;
      }
    }
    return false;
  }

  function getNumSolvers(string memory _id) public view returns(uint256) {
    address[] memory _solvers = solvers[_id];
    return _solvers.length;
  }

  function getSolvers(string memory _id) public view returns(address[] memory) {
    return solvers[_id];
  }

  function withdraw() public payable {
    require(msg.sender == owner);
    owner.transfer(address(this).balance);
  }

  function() payable external {}

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

}
