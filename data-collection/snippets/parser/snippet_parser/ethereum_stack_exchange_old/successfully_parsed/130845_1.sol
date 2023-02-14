contract Status {}
contract Caller {}
contract CallbackHash {}
contract ImplementResult is CallbackHash, Caller, Status {}
contract MainContract is Caller, Status {}
contract MainWithImplementing is Caller, CallbackHash, ImplementResult, MainContract {}
