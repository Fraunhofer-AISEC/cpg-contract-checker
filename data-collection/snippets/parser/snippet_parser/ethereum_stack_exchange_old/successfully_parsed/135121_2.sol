contract Contract {

    uint256[] public numbers;

    uint256 public counter;

    function addNumber() public {
        numbers.push(counter++);
    }

    function doOperation() public {

        uint256[] memory counterCopy = numbers;

        for(uint256 i = 0; i < counterCopy.length; i++) {
            counterCopy[i] = counterCopy[i] * 2;
        }

        numbers = counterCopy; 

    }

}
