uint private transitionCounter = 0;

modifier transitionCounting(uint nextTransitionNumber) {
require(nextTransitionNumber == transitionCounter);
transitionCounter += 1;
_;}
