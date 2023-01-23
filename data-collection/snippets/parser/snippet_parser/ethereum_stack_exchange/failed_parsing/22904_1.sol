contract NewToken{
    oldToken previousToken = new oldToken();
    previousToken.issueNewToken(xxxxx, yyyy);

}


contract OldToken{
    function issueNewToken(address recipient, uint amount){}
}
