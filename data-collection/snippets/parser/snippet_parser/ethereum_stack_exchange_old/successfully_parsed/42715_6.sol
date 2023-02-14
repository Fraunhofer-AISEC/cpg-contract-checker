contract Numbers {
    int[] public numbers;

    function Numbers() public {
        numbers.push(20);
        numbers.push(32);

        int[] storage myArray = numbers;
    }
}
