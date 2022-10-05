 uint public  cliff = 0 days;

 function changeCliff(uint time) public onlyOwner {
    cliff = time days;
}
