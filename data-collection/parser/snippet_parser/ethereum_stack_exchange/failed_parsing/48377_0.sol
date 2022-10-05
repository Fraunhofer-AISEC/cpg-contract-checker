browser/ballot.sol:77:5: Warning: Defining constructors as functions with the same name as the contract is deprecated. Use "constructor(...) { ... }" instead.
    function Owned() public {
    ^ (Relevant source part starts here and spans across multiple lines).

browser/ballot.sol:118:5: Warning: Defining constructors as functions with the same name as the contract is deprecated. Use "constructor(...) { ... }" instead.
    function ?name?Token() public {
    ^ (Relevant source part starts here and spans across multiple lines).

browser/ballot.sol:91:9: Warning: Invoking events without "emit" prefix is deprecated.
        OwnershipTransferred(owner, newOwner);

        ^-----------------------------------^
browser/ballot.sol:152:9: Warning: Invoking events without "emit" prefix is deprecated.
        Transfer(msg.sender, to, tokens);
        ^------------------------------^
browser/ballot.sol:167:9: Warning: Invoking events without "emit" prefix is deprecated.
        Approval(msg.sender, spender, tokens);
        ^-----------------------------------^
browser/ballot.sol:185:9: Warning: Invoking events without "emit" prefix is deprecated.
        Transfer(from, to, tokens);
        ^------------------------^
browser/ballot.sol:206:9: Warning: Invoking events without "emit" prefix is deprecated.
        Approval(msg.sender, spender, tokens);
        ^-----------------------------------^
browser/ballot.sol:224:9: Warning: Invoking events without "emit" prefix is deprecated.
        Transfer(address(0), msg.sender, tokens);
        ^--------------------------------------^
