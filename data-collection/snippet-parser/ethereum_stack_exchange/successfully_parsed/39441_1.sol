contract Mail{
    struct MailInfo{
        bytes ipfs;
        bytes enc_hash;
    } 
    mapping(address=>MailInfo) loginInfo;
    function getIPFS(address userId) public constant returns(bytes,bytes){
       return (loginInfo[userId].ipfs,loginInfo[userId].enc_hash);
    }

} 
