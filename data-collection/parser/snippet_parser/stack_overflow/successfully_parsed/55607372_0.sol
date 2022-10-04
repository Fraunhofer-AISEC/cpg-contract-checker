pragma solidity ^0.5.2;


contract Image{

    struct User {
    uint32 pixelsPainted;
    uint32 pixelsOwned;
    uint balance;
    uint earning;
    uint referrerAward;
    uint bonusCollected;
    uint bonusMask;
    uint bonusSettled;
    address referrer;
  }

  struct Pixel {
    address owner;
    
    uint price;
  }

  struct PaintLog {
    address user;
    uint price;
    bytes32 coordinate;
    
  }

  uint32 constant public activatePixelThreshold = 80000;
  uint constant public lastStageIncomeThreshold = 10000000000;
  uint32 constant public lastStageDuratio = 28800;
  uint constant public defaultPrice = 20000000;
  uint8 constant public incrementRate = 35;
  uint8 constant public potRatio = 10;
  uint8 constant public referrerRatio = 5;
  uint8 constant public feeRatio = 25;

  uint8 public stage;
  uint public endTime;
  uint public lastStageIncome;
  address public lastPainter;
  uint public lastPaintedAt;
  uint public bonusIndex;
  uint32 public allPixelsPainted;
  uint public grossIncome;
  uint public teamBalance;
  uint public marketValue;
  uint public finalPotAmount;
  uint8 public bonusRatio;
  uint8 public teamRatio;


  mapping(address=>imagestruct) public images;
  mapping(address => User) users;
  mapping(bytes32 => Pixel) pixels;
  PaintLog[] public logs;

   struct imagestruct{
      address adr;
      string imageHash;
   }

   function uploadImage(string memory hash) public{
       imagestruct memory img = imagestruct(msg.sender,hash);
       images[msg.sender]=img; 
   }

   function updateOwnerInfo(address addr, uint _balance, uint _earning, uint _bonus) public {
    User storage user = users[addr];
    user.balance += _balance;
    user.earning += _earning;
    user.bonusSettled += _bonus;
    user.pixelsOwned--;
  }

  function stringToBytes32(string memory source) public pure returns (bytes32 result) {
        assembly {
        result := mload(add(source, 32))
        }
        return result;
    }


  function buyImageTest(string memory ImageToBuy) public payable returns (uint32) {

    bytes32 input = stringToBytes32(ImageToBuy);

    uint totalSpent = 0;
    uint totalFees = 0;
    uint32 successCount = 0;
    User storage u = users[msg.sender];
    for (uint32 i = 0; i < input.length - 1; i += 2) {
      bytes32 coordinate = input[i];
      
      Pixel storage p = pixels[coordinate];
      if (p.owner == address(0)) {
          
        if (msg.value < totalSpent + defaultPrice) {
            break;
        }
        totalSpent += defaultPrice;
        totalFees += defaultPrice;
        marketValue += defaultPrice;
        p.owner = msg.sender;
        
        p.price = defaultPrice;
        allPixelsPainted++;
        u.pixelsOwned++;
        logs.push(PaintLog(msg.sender, defaultPrice, coordinate));
      } else {
        
        uint increment = p.price * incrementRate / 100; 
        uint newPrice = p.price + increment;
        if (msg.value < totalSpent + newPrice) {
          break;
        }
        totalSpent += newPrice;
        totalFees += increment * feeRatio / 100;
        marketValue += increment;

        uint ownerEarning = increment * (100 - feeRatio) / 100;
        updateOwnerInfo(p.owner, p.price + ownerEarning, ownerEarning, bonusIndex);

        u.pixelsOwned++;
        
        p.price = newPrice;
        p.owner = msg.sender;
        logs.push(PaintLog(msg.sender, newPrice, coordinate));
      }
      successCount++;
    }
    require(successCount > 0);
    if (msg.value > totalSpent) {
      u.balance += (msg.value - totalSpent);
    }
    if (successCount > 0) {
      if (stage == 0) {
        if (block.number >= endTime) {
          
          finalPotAmount = grossIncome * potRatio / 100;
          users[lastPainter].balance += finalPotAmount;
          bonusRatio += potRatio;
          stage = 1;
        } else {
          lastStageIncome += totalFees;
          if (lastStageIncome >= lastStageIncomeThreshold) {
            endTime = block.number + lastStageDuratio;
            lastStageIncome = 0;
          }
          lastPaintedAt = block.number;
          lastPainter = msg.sender;
        }
      }
      grossIncome += totalFees;
      u.pixelsPainted += successCount;
      u.bonusMask += (bonusIndex * successCount);
      bonusIndex += (totalFees * bonusRatio / 100 / allPixelsPainted);
      if (u.referrer != address(0)) {
        
        teamBalance += (totalFees * (teamRatio - referrerRatio) / 100);
      } else {
        teamBalance += (totalFees * teamRatio / 100);
      }
    }
    return successCount;
  }

}
