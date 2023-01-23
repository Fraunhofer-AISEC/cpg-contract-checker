pragma solidity >=0.4.22 <0.6.0;

contract Main {

    address payable chairperson;
    uint8 public constant N = 32;
    uint8 public constant M = 32;
    uint256 public constant initialTabPrice = 1 finney;
    uint256 public constant feePercent = 15;
    uint256 public constant referralPercent = 30;
    uint256 public constant appreciationPercent = 200;
    Tab[N][M] public tabs;
    mapping (bytes32 => address payable) referralLinks;

    struct Tab {
        address payable owner;
        uint256 price; 
        bytes32[2] linkUrl;
        bytes32[3] imageUrl;

        
        uint8 x; 
        uint8 X; 
        uint8 y; 
        uint8 Y;
    }

    struct ToPay {
        address payable owner;
        uint256 amount;
    }

    constructor() public {
        chairperson = msg.sender;
    }

    function uint2str(uint i) internal pure returns (string memory){
        if (i == 0) return "0";
        uint j = i;
        uint length;
        while (j != 0){
            length++;
            j /= 10;
        }
        bytes memory bstr = new bytes(length);
        uint k = length - 1;
        while (i != 0){
            bstr[k--] = byte(uint8(48 + i % 10));
            i /= 10;
        }
        return string(bstr);
    }

    function bytes32ToString(bytes32 x) internal pure returns (string memory) {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (uint j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
        return string(bytesStringTrimmed);
    }

    function getTabs(uint8 x1, uint8 y1, uint8 x2, uint8 y2) external view returns(string memory) {
        string memory res = "";
        for (uint8 yt = y1; yt <= y2; yt++) {
            for (uint8 xt = x1; xt <= x2; xt++) {
                 res = string(abi.encodePacked(res, ",", uint2str(getTabPrice(xt,yt)),  ",", bytes32ToString(tabs[xt][yt].linkUrl[0]), bytes32ToString(tabs[xt][yt].linkUrl[1]), ",", bytes32ToString(tabs[xt][yt].imageUrl[0]), bytes32ToString(tabs[xt][yt].imageUrl[1]), bytes32ToString(tabs[xt][yt].imageUrl[2]), "#", uint2str(tabs[xt][yt].x), ".", uint2str(tabs[xt][yt].X), ".", uint2str(tabs[xt][yt].y), ".", uint2str(tabs[xt][yt].Y)));
            }
        }  
        return res;
    }

    function getTabPrice(uint8 x, uint8 y) internal view returns(uint256) {
        if (tabs[x][y].price == 0) {
            return initialTabPrice;
        }
        return tabs[x][y].price;
    }

    function getTabOwner(uint8 x, uint8 y) internal view returns(address payable) {
        if (tabs[x][y].price == 0) {
            return chairperson;
        }
        return tabs[x][y].owner;
    }
    

    function buyTabs(uint8[4] calldata z, bytes32[6] calldata s) external payable {
        
        
        uint8 xt;
        uint8 yt;
        uint256 price = 0;
        uint256 tabPrice;
        address payable tabOwner;

        for (xt = z[0]; xt <= z[2]; xt++) {
            for (yt = z[1]; yt <= z[3]; yt++) {
                price += getTabPrice(xt,yt);
            }
        }

        
        assert(msg.value >= price);

        ToPay[1024] memory toPay;

        
        for (xt = z[0]; xt <= z[2]; xt++) {
            for (yt = z[1]; yt <= z[3]; yt++) {
                tabPrice = getTabPrice(xt,yt);
                tabOwner = getTabOwner(xt,yt);

                
                for(uint i=0; i<=toPay.length;i++) {
                    if (toPay[i].amount == 0) {
                        
                        toPay[i].owner = tabOwner;
                        toPay[i].amount = (tabPrice * (100-feePercent)) / 100;
                        break;
                    }

                    if (toPay[i].owner == tabOwner) {
                        toPay[i].amount += (tabPrice * (100-feePercent)) / 100;
                        break;
                    }
                }

                tabs[xt][yt] = Tab(msg.sender, tabPrice * appreciationPercent / 100, [s[0], s[1]] , [s[2], s[3], s[4]], xt-z[0], z[2]-z[0]+1, yt-z[1], z[3]-z[1]+1);
            }
        }

        for(uint i=0; i<=toPay.length;i++) {
            if (toPay[i].amount == 0) {
                break;
            }
            toPay[i].owner.transfer(toPay[i].amount);
        }

        if (s[5][0] != 0) {
            referralLinks[s[5]].transfer(address(this).balance * referralPercent / 100);
        }

        
        chairperson.transfer(address(this).balance);
    }

    function setReferralLink(bytes32 linkName) external {
        referralLinks[linkName] = msg.sender;
    }

    function retrieveLostEther() public {
        assert(msg.sender == chairperson);
        msg.sender.transfer(address(this).balance);
    }
}
