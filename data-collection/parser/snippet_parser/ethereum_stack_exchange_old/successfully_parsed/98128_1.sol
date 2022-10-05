
    struct Foo {
        address owner;
        uint mintedRound;
        uint winningRound;
    }
    struct FooOwner {
        uint[] foos;
        uint totalWinningFoos;
    }

    uint[][5] roundFoos;
    uint[][5] roundWinners;

    mapping(uint => Foo) public winningFoos;
    mapping(address => FooOwner) public fooOwners;

    uint totalWinningFoos;

    function shuffleFoos (uint256[] memory _array) internal view returns(uint[] memory){
        uint[] memory clone = cloneArray(_array, _array.length);
    
        for (uint256 i = 0; i < clone.length; i++) {
            uint256 n = i + uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp))) % (clone.length - i);
            uint256 temp = clone[n];
            clone[n] = clone[i];
            clone[i] = temp;
        }
        
        return clone;
    }
    
    function cloneArray(uint256[] memory _array, uint256 _length) internal pure returns (uint256[] memory) {
        uint256[] memory array = new uint256[](_length);
        for (uint256 i = 0; i < _length; i++) {
            array[i] = _array[i];
        }
        return array;
    }

    function reduceByHalf() internal  {
        uint[] memory clone = shuffleFoos(roundFoos[round]);
      
        uint halfLength = 0;

        halfLength = roundFoos[round].length.div(2);
        for (uint w = 0; w < halfLength; w++) {
           
           uint fooId = clone[w];
           
           roundWinners[round].push(fooId); 
           winningFoos[round].winningRound = round;
           
           address fooOwner = winningFoos[fooId].owner;
           
           fooOwners[fooOwner].totalWinningFoos = fooOwners[fooOwner].totalWinningFoos.add(1);    
        }
        
        totalWinningFoos = totalWinningFoos.add(halfLength);
    }
