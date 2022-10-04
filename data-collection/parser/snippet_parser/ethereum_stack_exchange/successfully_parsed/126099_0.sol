pragma solidity >0.4.0 ;
pragma experimental ABIEncoderV2;


contract Token {

    uint tokenTotal;    
    uint tokenPrice;    
    uint balanceTokens; 

    
    mapping(address=>uint) public  balances;

    event buySuccess(address addr, uint num);
    event sellSuccess(address addr, uint num);

    
    function getBalanceInfo() public view returns (
        uint, uint, uint, uint, uint, uint) {
        return (tokenTotal, tokenPrice,
                balanceTokens, address(this).balance,
                balances[msg.sender], msg.sender.balance);
    }

    
    function buy() public payable {
        uint tokensToBuy = msg.value / tokenPrice;
        require(tokensToBuy <= balanceTokens); 

        
        balances[msg.sender] += tokensToBuy;
        balanceTokens -= tokensToBuy;
        emit buySuccess(msg.sender, tokensToBuy);
    }

    
    function sell(uint tokensToSell) public {
        require(tokensToSell <= balances[msg.sender]); 

        
        uint total = tokensToSell * tokenPrice;
        balances[msg.sender] -= tokensToSell;
        balanceTokens += tokensToSell;
        payable(msg.sender).transfer(total);
        emit sellSuccess(msg.sender, tokensToSell);
    }
}
contract pile is Token{
    struct owners{
        uint[] publishedpiles;
        uint[] borrowedpiles;
        uint[] returnedpiles;
        uint[] commentedpiles;
    }
    uint public time;
    struct pile{
        address owner;
        string location;
        string style;
        string availabletime;
        string ISBN;
        string intro;
        string cover;
        string status;
        uint price;
        uint publishDate;
        uint score;
        uint comment;
        mapping(uint => Comment) comments;
        mapping(uint => BorrowNums) borrowNums;
    }

    struct Comment {
        address user; 
        uint date;      
        uint score;     
        string content; 
    }

    struct BorrowNums{
        uint borrowNum;
    }
    function getDate() internal returns(uint)
    {
        time = block.timestamp;
        return(time);
    }
    pile[] piles;
    uint tempNum = 1;
    mapping(address => owners) pilesPool;
    
    event publishpileSuccess(uint id, string location, string style, string availabletime,
        string ISBN,string intro, string cover, uint price, string status,
        uint publishDate);
    
    event evaluateSuccess(uint id,address addr,uint score);
    
    event borrowSuccess(uint id, address addr,uint price);
    
    event returnpileSuccess(uint id, address addr);
     
    
    function getBorrowedpiles() public view returns (uint[] memory){
        return pilesPool[msg.sender].borrowedpiles;
    }
    
    function getCommentedpile() public view returns(uint[] memory){
        return pilesPool[msg.sender].commentedpiles;
    }
    
    function getPublishedpiles() public view returns(uint[] memory){
        return pilesPool[msg.sender].publishedpiles;
    }
    
    function getReturnedpiles() public view returns(uint[] memory){
        return pilesPool[msg.sender].returnedpiles;
    }

    
    function getpilesLength() public view returns(uint){
        return piles.length;
    }

    
    function getCommentLength(uint id) public view returns (uint) {
        return piles[id].comment;
    }

    
    function getBorrowNums(uint id) public view returns(uint){
        pile storage pile = piles[id];
        BorrowNums storage b = pile.borrowNums[0];
        return b.borrowNum;
    }

    
    function getpileInfo(uint id) public view returns(address, string memory, string memory, string memory,string memory,string memory,string memory,
        string memory, uint, uint, uint, uint){ 
        require(id < piles.length);
        
        pile storage pile = piles[id];
        return (pile.owner,pile.location,pile.style,pile.availabletime,pile.ISBN,pile.intro,pile.cover,pile.status,
        pile.price,pile.publishDate,pile.score,pile.comment);
    }

    
    function getCommentInfo(uint pileId,uint commentId) public view returns(
        address, uint, uint, string memory){
        require(pileId < piles.length);
        require(commentId < piles[pileId].comment);
        Comment storage c = piles[pileId].comments[commentId];
        return (c.user, c.date, c.score, c.content);
    }

    
    function isEvaluated(uint id) public view returns (bool) {
        pile storage pile = piles[id];
        for(uint i = 0; i < pile.comment; i++)
            if(pile.comments[i].user == msg.sender)
                return true; 
        return false; 
    }

    
    function isBorrowed(uint id) public view returns (bool) {
        owners storage owners = pilesPool[msg.sender];
        for(uint i = 0; i < owners.borrowedpiles.length; i++)
            if(owners.borrowedpiles[i] == id)
                return true; 
        return false; 
    }

    function isMypile(uint id) public view returns(bool){
        pile storage pile = piles[id];
        if(pile.owner == msg.sender)
            return true;
        return false;
    }

    
    function ispileLeft(uint id) public payable returns(bool){
        require(id < piles.length);
        pile storage pile = piles[id];
        if(hashCompareInternal(pile.status,"out"))
            return true;
        return false;
    }

    
    function publishpileInfo(string memory location, string memory style, string memory availabletime,string memory ISBN,string memory intro,
        string memory cover,string memory status ,uint price) public {
        uint id = piles.length;
        uint tim= getDate();
        pile memory pile = pile(msg.sender,location,style,availabletime,ISBN,intro,cover,status,price,now,0,0);
        piles.push(pile);
        pilesPool[msg.sender].publishedpiles.push(id);
        emit publishpileSuccess(id,pile.location,pile.style,pile.availabletime,pile.ISBN,pile.intro,pile.cover,
            pile.price,pile.status,pile.publishDate);
    }

    
    function evaluate(uint id, uint score, string memory content) public{
        require(id < piles.length);
        
        pile storage pile = piles[id];
        
        require(0 <= score && score <= 10); 
        
        pile.score += score;
        pile.comments[pile.comment++] = Comment(msg.sender, now, score, content);
        pilesPool[msg.sender].commentedpiles.push(id);
        emit evaluateSuccess(id, msg.sender, pile.score);
    }

    
    function returnpile(uint id) public{
        require(id < piles.length);
        pile storage pile = piles[id];
        require(pile.owner != msg.sender && isBorrowed(id)); 
        pile.status = "in";
        pilesPool[msg.sender].returnedpiles.push(id);
        emit returnpileSuccess(id, msg.sender);
    }

    
    function borrowedpile(uint id) public{
        require(id < piles.length);
        pile storage pile = piles[id];
        require(pile.owner != msg.sender && !isBorrowed(id)); 
        pile.borrowNums[0] = BorrowNums(tempNum++);
        require(balances[msg.sender] >= pile.price); 
        balances[msg.sender] -= pile.price;
        balances[pile.owner] += pile.price;
        pilesPool[msg.sender].borrowedpiles.push(id);
        pile.status="out";
        emit borrowSuccess(id, msg.sender,pile.price);

    }

    
    function hashCompareInternal(string memory a, string memory b) internal returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }


}
