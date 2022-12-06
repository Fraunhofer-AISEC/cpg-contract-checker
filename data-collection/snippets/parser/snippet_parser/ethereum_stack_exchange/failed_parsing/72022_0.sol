uint256 public temp;
constructor() public payable {
.
.
.
.
  temp = 15;
    }
event DataCommited( int256 T, string _L);

function commitTask(int256 _temp, string memory _location) public inState(State.Created) payable{
require (keccak256(abi.encodePacked(location)) == keccak256(abi.encodePacked(_location)));
require(_temp < 35 && _temp > -5, "Temperature out of range");
dataCount += 1;

if(dataCount == rewardNum)
        {
            msg.sender.transfer(reward);
            emit TaskDone();
        }

        emit DataCommited( _temp, _location);
        _temp = temp;

    }
