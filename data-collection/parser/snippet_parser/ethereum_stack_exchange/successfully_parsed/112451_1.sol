address systemAddress = 0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2;

constructor(){
    
}

function funcA(address from) public view {
    require(
        from == systemAddress,
        "Invalid transaction source"
    );
}
