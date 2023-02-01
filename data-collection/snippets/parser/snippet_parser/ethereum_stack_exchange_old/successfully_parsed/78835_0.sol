import './EMPToken.sol';
contract socialposts {


EMPToken token;
address _empTokenAdr = 0xd3591733C103EaCfBE7e0c2b4C037764dA836FDe;
constructor() public {


createPost('I am using Blokchain','David Abrahim');

}
function createPost(string memory content,string memory name) public {
   postCount++;
   posts[postCount] = post(postCount,content,name,msg.sender);
   
   token = EMPToken(_empTokenAdr);
   token.approve(msg.sender,2);
   }
}
