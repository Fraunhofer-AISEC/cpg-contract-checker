struct Numbers{
    uint _number;
}

Numbers[] NumbersArrayTest;

function addElements(uint _number) public{
    NumbersArrayTest.push(Numbers(_number));
    elementsCounter +=1;
}
