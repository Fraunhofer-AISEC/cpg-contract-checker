constructor() public{
    secret = _secret;

}

function getsecret() public view returns(string memory){
    return secret;
}