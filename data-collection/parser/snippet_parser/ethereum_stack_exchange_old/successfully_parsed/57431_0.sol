pragma solidity^0.4.24;

contract Dicegame {

    address owner =  0x62a0bbA644863c09cB97Bda35b946c27C359A8F3;

    mapping(address => string)resultt;
    mapping(address => uint)randnumber;
    mapping(address => uint)winmoneyy;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function payforstartbet(uint _undernumber,string _name) public payable {

        require(msg.value < 100000000000000000000);
        require(msg.value > 100000000000000000);
        require(_undernumber <= 98);
        require(_undernumber >= 1);

        string memory betresult;
        uint winmoney;
        uint ownerget;
        uint randnum = uint(keccak256(abi.encodePacked(now,msg.sender,_name,blockhash(block.number-1),block.difficulty))) % 100; 
        uint winchance = _undernumber;

        if(_undernumber > randnum){
            betresult = "win!";
        } else {
            betresult = "lose!";
        }

        if(keccak256(abi.encodePacked(betresult)) == keccak256(abi.encodePacked("win!"))) {
            winmoney = msg.value + ((msg.value * 100 / winchance) - msg.value) * 24 / 25 ;
            ownerget = ((msg.value * 100 / winchance) - msg.value) * 1 / 25 ;
            msg.sender.transfer(winmoney);
            owner.transfer(ownerget);
        } else {
            winmoney = 0;
            ownerget = 0;
        }

        resultt[msg.sender] = betresult;
        randnumber[msg.sender] =  randnum;
        winmoneyy[msg.sender] = winmoney;

    }

    function withdraw() external onlyOwner {
        owner.transfer(this.balance);
    }
    function winorlose() external view returns(string) {
        return resultt[msg.sender];
    }
    function showtheend() external view returns(uint, uint) {
        return (randnumber[msg.sender],winmoneyy[msg.sender]);
    }

}
