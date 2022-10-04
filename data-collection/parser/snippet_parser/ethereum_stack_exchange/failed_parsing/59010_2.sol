function enter() public payable {
if (Pause == false) {
...do that...}
else{
revert("raffle is in pause. We are picking the winner"); }
