import os
import sys
path = sys.argv[1]

checkmapping = {
  "AccessControlLogicCheck": "Non constructor function insufficiently restricts writes to to access control variables",
  "AccessControlSelfdestructCheck": "Missing Access Control to Selfdestruct",
  "AddressPaddingCheck": "Message padding vulnerability found at ether transfer.",
  "BadRandomnessCheck": "A deterministic or predictable value may be used as bad random number.",
  "CallReturnCheck": "Missing Check of Return Value from external Call",
  "DefaultProxyDelegateCheck": "No whitelisting of calls proxied to another contract",
  "DOSThroughExhaustionCheck": "An expensive operation in a loop with a user controlled or often repeated condition can exhaust gas and deny reliable execution.",
  "FrontRunningCheck": "A miner can use others input to gain a benefit himself.",
  "LocalWriteToStorageCheck": "Write to uninitialized variable might unintentionally write to storage.",
  "OverUnderflowCheck": "Result of expression can be over- or under-flown by external entity",
  "ReentrancyCheck": "Reentrancy Vulnerability",
  "TimeManipulationCheck": "Miners can manipulate program execution by selecting when to include the timestamp",
  "TXOriginCheck": "Access control enforcement through transactions origin is vulnerable to phishing attacks "
}

vulnerable_contracts = {}
            
def parse_vulnerabillities(dirname, filename):
    snippet_folder = os.path.basename(os.path.normpath(dirname))
    snippet_name = snippet_folder + ".sol"
    with open(os.path.join(dirname, filename)) as f:
        findings = []
        content = f.read()
        for k,v in checkmapping.items():
            if v in content:
                findings.append(k)
        if(findings):
            entry = [snippet_name] + findings
            vulnerable_contracts[snippet_name] = entry
            print(vulnerable_contracts[snippet_name])
    
    
    
fname = []
for root, d_names, f_names in os.walk(path):
    for f in f_names:
        if f.endswith("result.log"):
            fname.append(os.path.join(root, f))
            parse_vulnerabillities(root, f)
print(len(fname))
