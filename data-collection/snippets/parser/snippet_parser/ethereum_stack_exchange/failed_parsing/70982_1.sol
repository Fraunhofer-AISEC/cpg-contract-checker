pragma solidity^0.5.0;

contract Score {
    unit24[]score;

    function addScore(unit24 s) public returens(unit24 []memory){
        score.push(s);
        return score;
    }

    function getLength()view public returens(unit){
        return score.length;
    }

    function clearArray() public returens(unit24 [] memory){
        delete score;
        return score;
    }
}
