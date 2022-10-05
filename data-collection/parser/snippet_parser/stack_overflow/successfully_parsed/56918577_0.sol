    pragma solidity >=0.5.0;


    contract lotteryAdvanced {
        address public manager;
        mapping(address=>uint) public players;
        uint public totalAmount = 0;
        uint public numPlayers = 0;
        address[] public users;
        modifier managerOnly() {
            require(msg.sender == manager, 'You are not the manager of this game');
            _;
        }
        constructor() public{
            manager = msg.sender;
        }


        function join() public payable{
            require(msg.value >= 100000000000000000 wei, 'Please enter a number within the provided range');
            for( uint i = 0; i <= uint(users.length) ; i++)
            {
              if(msg.sender == users[i]) {
                players[msg.sender] = players[msg.sender] + msg.value;
              }
              players[msg.sender] = msg.value;
              users.push(msg.sender);
            }
            numPlayers++;
        }
    ```
}