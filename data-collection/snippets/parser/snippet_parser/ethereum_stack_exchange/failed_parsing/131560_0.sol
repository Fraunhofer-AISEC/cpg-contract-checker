contract xxxx {
using SafeMath for uint256;

function unchecked_inc(uint i) private pure returns (uint) {
    unchecked {
        return ++i;
    }
}

struct User {
    uint id;
    uint partnersCount;
    address referrer;

    mapping(uint256 => bool) activeX3Levels;
    mapping(uint256 => bool) activeX6Levels;

    mapping(uint256 => X3) x3Matrix;
    mapping(uint256 => X6) x6Matrix;

}

struct X3 {
    address currentReferrer;
    address[] referrals;
    bool blocked;
    uint reinvestCount;
    uint noOfPayment;
    uint256 lastSettledDailyGlobal;
}

struct X6 {
    address currentReferrer;
    address[] firstLevelReferrals;
    address[] secondLevelReferrals;
    bool blocked;
    uint reinvestCount;
    uint noOfPayment;
    address closedPart;
    uint256 lastSettledDailyGlobal;
}

struct DailyData{
    uint totalInvestedamount;
    uint investedTillDate;
    uint roundId;
    uint endTime;
    uint noofUsers;
}

...

function collect() public {
    User storage player = users[msg.sender];
    uint profit=0;

    for(uint8 j=1;j<=16;j++){
        if(!users[msg.sender].activeX3Levels[j] && !users[msg.sender].activeX6Levels[j]){
            break;
        }
            for(uint i=player.x3Matrix[j].lastSettledDailyGlobal;i<dailyDividendRoundid && i<player.x3Matrix[j].lastSettledDailyGlobal.add(Max_Limit_Global_Withdrawal) && users[msg.sender].activeX3Levels[j]; i = unchecked_inc(i))
            {
                if(GlobalDailyDataListX3[j][i].totalInvestedamount>0   && GlobalDailyDataListX3[j][i].noofUsers>0){
                    profit=profit.add(GlobalDailyDataListX3[j][i].totalInvestedamount/GlobalDailyDataListX3[j][i].noofUsers);
                }
            }
            for(uint k=player.x6Matrix[j].lastSettledDailyGlobal;k<dailyDividendRoundid  && k<player.x6Matrix[j].lastSettledDailyGlobal.add(Max_Limit_Global_Withdrawal) && player.activeX6Levels[j];k++)
            {
                if(GlobalDailyDataListX4[j][k].totalInvestedamount>0 && GlobalDailyDataListX4[j][k].noofUsers>0){
                    profit=profit.add(GlobalDailyDataListX4[j][k].totalInvestedamount.div(GlobalDailyDataListX4[j][k].noofUsers));
                }
            }

            users[msg.sender].x3Matrix[j].lastSettledDailyGlobal=i;
            users[msg.sender].x6Matrix[j].lastSettledDailyGlobal=k;
        }


    msg.sender.transfer(profit);
    emit Withdrawn(msg.sender, profit,2);
  }
}
