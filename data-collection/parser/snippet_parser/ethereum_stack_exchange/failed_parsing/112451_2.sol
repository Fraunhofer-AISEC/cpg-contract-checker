uint[] data;

constructor(){
   
    data.push(10);
}

modifier fromSystem() {
 require(
        msg.sender == systemAddress,
        "Only systemAddress can call this."
    );
    _;
}

function funcB() public view fromSystem returns (uint256){
    
    return data[0];
}
