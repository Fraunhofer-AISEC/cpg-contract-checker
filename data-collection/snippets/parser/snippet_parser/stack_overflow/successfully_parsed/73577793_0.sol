event Increment(uint value);
event Decrement(uint value);

function getCount() view public returns(uint) {
    return Count;
}

function Increment() public {
   Count += 1;
   emit Increment(Count);
}

function Decrement() public {
   count -= 1;
   emit Decrement(Count);
}
