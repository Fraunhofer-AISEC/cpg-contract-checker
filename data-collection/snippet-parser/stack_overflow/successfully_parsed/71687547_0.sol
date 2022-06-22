struct Details{
        uint256 id;
        address walletAddress;
        string fullName;
        uint256 phoneNumber;
        string residentialAddress;

    }
Details [] public userDetails;

function deleteData(uint256 _id) public onlyOwner returns(string memory){
    for(uint256 i=0;i<userDetails.length;i++)
    {
        if (userDetails[i].id==_id){
(userDetails[i],userDetails[userDetails.length-1])=(userDetails[userDetails.length-1],userDetails[i]);
userDetails.pop();
}
}
}
