    uint[] public numbers = [1, 2, 3];
    uint[] public numbers2;

    function multiplyArray(uint a) public {
        uint b = numbers.length;
        uint counter = 0;
        for (uint i = 1; i <= b; i++)
        {
        numbers2[i] = numbers[i] * a;
        counter++;
        }
    }
