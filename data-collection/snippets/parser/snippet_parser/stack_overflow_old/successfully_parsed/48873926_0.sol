function addPig(uint _idNum, uint _age, uint _weight) public returns (string) {

    var newPig = Pig(_idNum, _age, _weight, owner, 0);

    
    if(pigs[_idNum].idNum != 0x0) {
        return("This pig already exists");
    } else {
        
        pigs[_idNum] = newPig;
        pigsArray.push(newPig);
        farmPigs++;
    }
    Details(_idNum, _age, _weight); 
}
