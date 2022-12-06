
function testSomething() payable public {
   Assert.greaterThan(msg.value, uint(50), 'value should be > 50');
}
