contract Lottery {

    
    int constant LOTTERY_INTERVAL = 1 days;

    uint256 constant private TICKET_PRICE = 1;

    uint constant FEE_FACTOR = 200; 

    
    uint256 totalBalance = 0;

    uint totalParticipants = 0;

    uint winnerCounter = 0;

    
    struct TicketHolder {
    address ticketHolder;
    uint estimation;
    uint buyingTimeScore;
    uint timestamp;
    uint score;
    }

    
    mapping (address => TicketHolder) ticketHolders;

    mapping (uint => TicketHolder) ticketHoldersIndex;

    
    address[] ticketHoldersAddress;

    address [] winners;

    
    function Lottery(){

    }

    
    function getBuyingTime(address ticketHolder)  returns (uint){
        return ticketHolders[ticketHolder].buyingTimeScore;
    }


    function getEstimation(address ticketHolder)  returns (uint){
        return ticketHolders[ticketHolder].estimation;
    }

    function getScore(address ticketHolder)  returns (uint){
        return ticketHolders[ticketHolder].score;
    }


    function getMinute(uint timestamp)  constant returns (uint8) {
        return uint8((timestamp / 60) % 60);
    }

    function setScore(address ticketHolder, uint score) {
        ticketHolders[ticketHolder].score = score;
    }

    function calculateBuyingTimeScore()  returns (uint){
        uint timeBeforeNewRound = 60 - getMinute(now);
        return timeBeforeNewRound * 100 * 100 / 60;
    }

    function calculateDeviationScore(uint courseValue, uint estimatedValue)  returns (uint){
        uint difference = 0;
        if (courseValue >= estimatedValue) {
            difference = courseValue - estimatedValue;
        }
        else if (courseValue < estimatedValue) {
            difference = estimatedValue - courseValue;
        }

        
        uint deviation = (difference * 10000 / courseValue);
        uint score = 10000 - deviation;
        return score;
    }

    
    function buyTicket(uint estimation) payable {
        if (msg.value < TICKET_PRICE) throw;
        address ticketHolder = msg.sender;
        uint buyingTimeScore = calculateBuyingTimeScore();
        totalBalance += msg.value;
        ticketHolders[ticketHolder] = TicketHolder(msg.sender, estimation, buyingTimeScore, now, 0);
        ticketHoldersIndex[totalParticipants++] = TicketHolder(msg.sender, estimation, buyingTimeScore, now, 0);
        ticketHoldersAddress.push(ticketHolder);
    }

    function calculateScore(uint courseValue)  {
        if (totalParticipants == 0) throw;
        for (uint participant = 0; participant < totalParticipants; participant++) {
            TicketHolder ticketHolder = ticketHoldersIndex[participant];
            uint deviationScore = calculateDeviationScore(courseValue, ticketHolder.estimation) / 2;
            uint buyingTimeScore = ticketHolder.buyingTimeScore / 2;
            uint totalScore = deviationScore + buyingTimeScore;
            setScore(ticketHolder.ticketHolder, totalScore);
        }
    }

    function determineWinners()  returns (uint){
        uint highestScore = 0;
        for (uint participant = 0; participant < totalParticipants; participant++) {
            TicketHolder ticketHolder = ticketHoldersIndex[participant];
            uint score = ticketHolder.score;
            if (score >= highestScore) {
                winners.push(ticketHolder.ticketHolder);
                winnerCounter++;
                highestScore = score;
            }
        }
        return ticketHoldersAddress.length;
    }

    function payout(uint courseValue)  {
        if (totalParticipants == 0) throw;
        calculateScore(courseValue);
        determineWinners();
        uint256 winAmount = totalBalance / winnerCounter;
        for (uint i = 0; i < winnerCounter; i++) {
            address winnerTicket = winners[i];
            winnerTicket.transfer(winAmount);
        }
    }

}
