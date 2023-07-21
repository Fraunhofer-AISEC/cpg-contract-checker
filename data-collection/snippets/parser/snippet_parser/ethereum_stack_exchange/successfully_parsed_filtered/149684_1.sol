event donated(address indexed owner,uint indexed amount,uint indexed timestamp);
string public campaignTitle;
string public story;
uint public requireAmount;
uint public receivedAmount;
address payable public campaignOwner;
string public image;

constructor(
    string memory _campaignTitle,
    string memory _story,
    uint _requireAmount,
    address _owner,
    string memory _image
    ){
        campaignTitle=_campaignTitle;
        story=_story;
        requireAmount=_requireAmount;
        campaignOwner=payable(_owner);
        image=_image;
    }

function donate()payable public{

    require(requireAmount>receivedAmount,"Require Amount is fullfilled");
    campaignOwner.transfer(msg.value);
    receivedAmount+=msg.value;

    emit donated(msg.sender, msg.value, block.timestamp);

}
