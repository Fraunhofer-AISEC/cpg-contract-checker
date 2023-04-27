import os
import sys
import json
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

check_frequency = {}

vulnerable_contracts = {}

clone_checks = {}

contract_creation_times = {}


of = 0
excludenr = 0

class SetEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, set):
            return list(obj)
        return json.JSONEncoder.default(self, obj)
            
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
            entry = {"findings": findings, "clones": []}
            vulnerable_contracts[snippet_name] = entry
    
    
def collect_timestamps():
    timestamp_mapping= {}
    with open("stack_overflow_posts.json") as f:
        line = f.readline()
        while line:
            sos = json.loads(line)
            if sos["question_id"] in timestamp_mapping:
                print("Dublicate snippet entries for: " + str(sos["question_id"]))
            timestamp_mapping[sos["question_id"]] = sos["creation_date"]
            
            line = f.readline()
    with open("ethereum_stack_exchange_posts.json") as f:
        line = f.readline()
        while line:
            sos = json.loads(line)
            if sos["question_id"] in timestamp_mapping:
                print("Dublicate snippet entries for: " + str(sos["question_id"]))
            timestamp_mapping[sos["question_id"]] = sos["creation_date"]
                    
            line = f.readline()
        with open("smart_contract_sanctuary_timestamps.json") as f:
            line = f.readline()
            while line:
                sos = json.loads(line)
                address = sos["contractAddress"].lower()
                if address in contract_creation_times:
                    print("Dublicate contract entries for: " + address)
                contract_creation_times[address] = sos["timestamp"]
                        
                line = f.readline()
    for k,v in vulnerable_contracts.items():
        question_id = int(k.split("_")[0])
        if question_id in timestamp_mapping:
            vulnerable_contracts[k]["timestamp"] = timestamp_mapping[question_id]
        else:
            print("Sample without timestamp: " + str(k))
    # print(timestamp_mapping)
        
            

            
def collect_clone_mapping(snippet_to_contract):
    for root, d_names, f_names in os.walk(snippet_to_contract):
        for f in f_names:
            with open(os.path.join(root, f)) as mapping:
                snippet_name = os.path.splitext(f)[0]
                snippet_file = snippet_name + ".sol"
                if snippet_file in vulnerable_contracts:
                    clone = []
                    line = mapping.readline()
                    while line:
                        sos = line.split(",")[3]
                        
                        if not sos.startswith("File Path"):
                            vulnerable_contracts[snippet_file]["clones"].append(sos)
                            
                        line = mapping.readline()

                    
def eliminate_impossible_causal_clones():
    global of, excludenr
    for k, v in vulnerable_contracts.items():
        incorrect_clones = []
        of += len(v["clones"])
        for clone in v["clones"]:
            clone_address = "0x" + os.path.basename(clone).split("_")[0].lower()
            if clone_address in contract_creation_times:
                if v["timestamp"] >= contract_creation_times[clone_address]:
                    excludenr += 1
                    incorrect_clones.append(clone)
        v["clones"] = [clone for clone in v["clones"] if clone not in incorrect_clones]
    
                    
                

def collect_statistics():
    for key in checkmapping:
        check_frequency[key] = 0
    for k,v in vulnerable_contracts.items():
        for check in v["findings"]:
            check_frequency[check] += 1
        for clone in v["clones"]:
            if not clone in clone_checks:
                clone_checks[clone] = set()
            clone_checks[clone] = clone_checks[clone].union(set(v["findings"]))
    
    
    
fname = []
snippets_with_results = 0
for root, d_names, f_names in os.walk(path):
    for f in f_names:
        if f.endswith("result.log"):
            fname.append(os.path.join(root, f))
            parse_vulnerabillities(root, f)
            snippets_with_results += 1
print("Number of snippets: " + str(snippets_with_results))
print("Number of vulnerbale snippets: " + str(len(vulnerable_contracts)))
collect_timestamps()
collect_clone_mapping(sys.argv[2] + "/ethereum_stack_exchange_matches" )
collect_clone_mapping(sys.argv[2] + "/stack_overflow_matches")
print("Of which snippets have clones: " + str(len([snip for snip in vulnerable_contracts if vulnerable_contracts[snip]["clones"]])))
eliminate_impossible_causal_clones()
print("After filtering for timestamp " + str(len([snip for snip in vulnerable_contracts if vulnerable_contracts[snip]["clones"]])) + " of clones remain.")
collect_statistics()
# TODO Print statistics
# Number of snippets with vuln, number of snippets that also have a vulnerable clone.
# avg number of checks to rerun per clone file, appearances of each vulnerbaility in vuln snippets

print(str(excludenr) + " of " + str(of) +" clone relations were not valid")
print("Number of clones to analyze: " + str(len(clone_checks)))
nr = 0
for clone, checks in clone_checks.items():
    nr += len(checks)
    
print(nr / len(clone_checks))

print(check_frequency)

with open('snippets_to_checks.json', 'w') as f:
    json.dump(vulnerable_contracts, f, cls=SetEncoder)
    
with open('contract_checks_verify.json', 'w') as f:
    json.dump(clone_checks, f, cls=SetEncoder)
