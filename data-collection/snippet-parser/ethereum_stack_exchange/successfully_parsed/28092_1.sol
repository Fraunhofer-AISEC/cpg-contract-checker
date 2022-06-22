pragma solidity ^0.4.11;

contract Fund{
    uint startDate;
    uint endDate;
    uint totalPrizePool;
    uint[] indexes;
    uint num;
    uint payDay;
    uint nextCampaignId;
    uint reprocessLock;
    address owner;

    function Fund(){
        startDate = now;
        endDate   = now + 12 minutes;
        payDay = endDate;
        reprocessLock = 0;
        owner = msg.sender;
        totalPrizePool = 0;
    }

    mapping (address => uint) phoneBook;
    mapping (uint => Payment) payment;

    struct Payment {
    uint amount;
    uint dateOfPayment;
    uint paymentsCount;
    address payOutAddr;
    }

    event enrolled(address payoutAddress, address sender, uint dateOfTransaction);
    event checker(address adr, uint amount, uint date, int paycount);
    modifier validateIfContractOpen(){ if(startDate + 30 minutes < now ) revert(); _; }
    modifier validateIfAlreadyExist(address payOutAddr){ if(payment[phoneBook[payOutAddr]].paymentsCount != 0) revert(); _; }
    modifier validateMsg(){ if(msg.value != 0.1 ether) revert(); _; }

    function enroll(address payOutAddr) payable
    validateMsg()
    validateIfContractOpen()
    validateIfAlreadyExist(payOutAddr)
    {
        phoneBook[payOutAddr] = nextCampaignId;

        payment[phoneBook[payOutAddr]].payOutAddr = payOutAddr;
        payment[phoneBook[payOutAddr]].amount += msg.value;
        payment[phoneBook[payOutAddr]].dateOfPayment = now;
        payment[phoneBook[payOutAddr]].paymentsCount += 1;

        enrolled(payOutAddr,msg.sender,now);

        nextCampaignId++;
    }

    event paymentAccepted(address payoutAddress, address sender, uint dateOfTransaction);



    function paycount(address addr){
        logger(payment[phoneBook[addr]].paymentsCount);
    }

    modifier checkFee(address payOutAddr){
        uint lifeCycle = now - startDate;

        uint cycleOfContract = lifeCycle / 3 minutes; 
        uint begin = 3 minutes * cycleOfContract;
        uint end = begin + 3 minutes;

        int notPayedCycles = int(cycleOfContract - payment[phoneBook[payOutAddr]].paymentsCount);

        
        if(lifeCycle > begin && lifeCycle < end){

            uint semiTotalFee = 0.02 ether * uint(notPayedCycles) + (0.1 ether * uint(notPayedCycles));
            uint totalFee = 0.1 ether + semiTotalFee;
            logger(semiTotalFee);
            logger(totalFee);
            if(msg.value != totalFee){
                revert();
            }
            _;
        }
        else{
            revert();
            _;
        }

    }


    modifier validatePaymentCountAndDate(address payOutAddr){ if (payment[phoneBook[payOutAddr]].paymentsCount == 3 ||
    (now - startDate / 3 minutes) == payment[phoneBook[payOutAddr]].paymentsCount) revert(); _; }

    modifier checkIfenrolled(address payOutAddr){  if (payment[phoneBook[payOutAddr]].paymentsCount < 1 ) revert(); _;  }

    function deposit(address payOutAddr) payable
    checkFee(payOutAddr)
    validatePaymentCountAndDate(payOutAddr) 
    {
        payment[phoneBook[payOutAddr]].amount += msg.value;
        payment[phoneBook[payOutAddr]].dateOfPayment = now;

        uint moneyWithoutFee = msg.value - (0.02 ether * (((((now - startDate)/3 minutes) - payment[phoneBook[payOutAddr]].paymentsCount))));

        payment[phoneBook[payOutAddr]].paymentsCount += moneyWithoutFee / 0.1 ether;
        paymentAccepted(payment[phoneBook[payOutAddr]].payOutAddr, msg.sender, now);

    }

    modifier validateIfEnded(){ if (endDate > now && reprocessLock != 0) revert(); _; } 

    event push(address sila);

    function reproccess()
    validateIfEnded()
    {
        uint i = 0;
        uint j = 0;
        uint prizePool;
        while(payment[i].paymentsCount != 0){
            if(payment[i].paymentsCount != 3){
                prizePool += payment[i].amount;
                payment[i].amount = 0; 
                j++;
            }
            if(payment[i].paymentsCount == 3){
                worthy[payment[i].payOutAddr] = 1;
            }
            i++;
        }
        reprocessLock = 1;
        totalPrizePool = (prizePool/(i-j))/3;
    }


    mapping (address => uint) worthy;


    modifier isWorth(address payOutAddress){ if( worthy[payOutAddress] != (now - endDate)/3 minutes + 1) revert(); _; }
    modifier checkReprocessLock(){ if (reprocessLock != 1) revert(); _; }

    function withDraw(address payOutAddress)
    isWorth(payOutAddress)
    checkReprocessLock()
    {
        payOutAddress.transfer(0.1 ether + totalPrizePool);
        worthy[payOutAddress] += 1;
    }



    function checkReprocess(){
        logger(reprocessLock);
    }

    function giveFunds()payable{}


    function checkpayroll(){

    }



    modifier own(){ if(msg.sender != owner) revert(); _; }
    function die()
    own()
    {
        msg.sender.transfer(this.balance);
    }

    function paaa(address addr){

        addr.transfer(0.1 ether);

    }

}
