import os
import sys
import json
import filecmp
import re
path = sys.argv[1]
import hashlib
import functools

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

validated_checks = {
  "AccessControlLogicCheck": [],
  "AccessControlSelfdestructCheck": [],
  "AddressPaddingCheck": [],
  "BadRandomnessCheck": [],
  "CallReturnCheck": [],
  "DefaultProxyDelegateCheck": [],
  "DOSThroughExhaustionCheck": [],
  "FrontRunningCheck": [],
  "LocalWriteToStorageCheck": [],
  "OverUnderflowCheck": [],
  "ReentrancyCheck": [],
  "TimeManipulationCheck": [],
  "TXOriginCheck": [],
}

snippets_by_check = {
  "AccessControlLogicCheck": [],
  "AccessControlSelfdestructCheck": [],
  "AddressPaddingCheck": [],
  "BadRandomnessCheck": [],
  "CallReturnCheck": [],
  "DefaultProxyDelegateCheck": [],
  "DOSThroughExhaustionCheck": [],
  "FrontRunningCheck": [],
  "LocalWriteToStorageCheck": [],
  "OverUnderflowCheck": [],
  "ReentrancyCheck": [],
  "TimeManipulationCheck": [],
  "TXOriginCheck": [],
}

clone_reverse_lookup = {}

check_frequency = {}

vulnerable_contracts = {}

validated_contracts = {}

clone_checks = {}

contract_creation_times = {}

normalized_file_hash = {}

normalized_file_content = {}


of = 0
excludenr = 0

dublicates= set()

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
            
def parse_validations(dirname, filename):
    snippet_folder = os.path.basename(os.path.normpath(dirname))
    snippet_name = snippet_folder + ".sol"
    with open(os.path.join(dirname, filename)) as f:
        findings = []
        content = f.read()
        for k,v in checkmapping.items():
            if v in content:
                findings.append(k)
                validated_checks[k].append(snippet_name)
        if(findings):
            entry = {"findings": findings}
            validated_contracts[snippet_name] = entry
    
    
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
                        sos = line.split(",")[3].strip()
                        
                        if not sos.startswith("File Path"):
                            vulnerable_contracts[snippet_file]["clones"].append(sos)
                            shortened = sos.split("/")[-1].replace("$","DOLLAR")
                            if not shortened in clone_reverse_lookup:
                                clone_reverse_lookup[shortened] = [snippet_name]
                            else:
                                clone_reverse_lookup[shortened].append(snippet_name)
                            
                        line = mapping.readline()

                    
def eliminate_impossible_causal_clones():
    global of, excludenr
    size = len(vulnerable_contracts)
    current = 0
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
        v["clones"] = remove_dublicates(v["clones"])
        current += 1
        if current % 500 == 0:
            print("Done: " + str(current) + " / "+ str(size))
    
                    
                

def collect_statistics():
    for key in checkmapping:
        check_frequency[key] = 0
    for k,v in vulnerable_contracts.items():
        for check in v["findings"]:
            check_frequency[check] += 1
            snippets_by_check[check].append(k)
        for clone in v["clones"]:
            if not clone in clone_checks:
                clone_checks[clone] = set()
            clone_checks[clone] = clone_checks[clone].union(set(v["findings"]))

def comment_remover(text):
    def replacer(match):
        s = match.group(0)
        if s.startswith('/'):
            return " " # note: a space and not an empty string
        else:
            return s
    pattern = re.compile(
        r'//.*?$|/\*.*?\*/|\'(?:\\.|[^\\\'])*\'|"(?:\\.|[^\\"])*"',
        re.DOTALL | re.MULTILINE
    )
    return re.sub(pattern, replacer, text)
            
def remove_dublicates(candidates):
    dubfree = []
    basepath = sys.argv[3]
    candlen = len(candidates)
    while candidates:
        candidate = candidates.pop(0)
        isDub=False
        for ref in dubfree:
            if codecmp(basepath + candidate, basepath + ref):
            #if filecmp.cmp(basepath + candidate, basepath + ref, shallow=False):
                isDub=True
                break
        if not isDub:
            dubfree.append(candidate)
    return dubfree
    
def codecmp(a,b):
    if a+b in dublicates:
        return True
    #with open(a) as f:
    #    at = ''.join(comment_remover(f.read()).split())
    #    with open(b) as g:
    #        bt = ''.join(comment_remover(g.read()).split())
    if is_equal(a,b):
        dublicates.add(a+b)
        dublicates.add(b+a)  
        return True
    return False

def is_equal(a, b):
    if not a in normalized_file_hash:
        with open(a) as f:
            normalized = ''.join(comment_remover(f.read()).split())
            normalized_file_content[a] = normalized
            normalized_file_hash[a] = sha512(normalized)
    if not b in normalized_file_hash:
        with open(b) as g:
            normalized = ''.join(comment_remover(g.read()).split())
            normalized_file_content[b] = normalized
            normalized_file_hash[b] = sha512(normalized)
    
    return normalized_file_hash[a] == normalized_file_hash[b] and normalized_file_content[a] == normalized_file_content[b]

def sha512(data):
    return hashlib.sha256(data.encode('utf-8')).digest()
    
    
def parse_validation_results(resultpath):
    contracts_with_results = 0
    for root, d_names, f_names in os.walk(resultpath):
        for f in f_names:
            if f.endswith("result.log"):
                fname.append(os.path.join(root, f))
                parse_validations(root, f)
                contracts_with_results += 1
    
    
def print_review_sample():
    # print(clone_reverse_lookup)
    with open('review_sample.txt', 'w') as f:
        for k,v in validated_checks.items():
            f.write(k+"\n")
            i = 0
            snippets = []
            contracts = []
            for contract in v:
                if len(snippets) >= 20:
                    break
                for snippet in clone_reverse_lookup[contract.split("/")[-1].replace("$","DOLLAR")]:
                    if not contract in contracts:
                        if snippet + ".sol" in snippets_by_check[k]:
                            if not snippet in snippets:
                                i += 1
                                snippets.append(snippet)
                                contracts.append(contract)
                                f.write(snippet + ".sol [ ]; is clone []; " + contract + " []\n")
                            
            f.write("\n")


    
    
    
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
# eliminate_impossible_causal_clones()
print("After filtering for timestamp " + str(len([snip for snip in vulnerable_contracts if vulnerable_contracts[snip]["clones"]])) + " of snippets remain.")
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

distinct = set([clone.split("_")[-1] for clone in clone_checks])
print("nr names: " + str(len(distinct)))
for k,v in vulnerable_contracts.items():
    v["clones"] = [clone.replace("$","DOLLAR") for clone in v["clones"]]


with open('snippets_to_checks.json', 'w') as f:
    json.dump(vulnerable_contracts, f, cls=SetEncoder)
    
with open('contract_checks_verify.json', 'w') as f:
    json.dump(clone_checks, f, cls=SetEncoder)
    
with open('contract_to_verify.txt', 'w') as f:
    for contract in clone_checks:
        f.write(sys.argv[3] + contract.replace("$","DOLLAR") + "\n")
        
if sys.argv[4]:
    parse_validation_results(sys.argv[4])
    print_review_sample()
    
print("Number of vulnerbale code clones: " + str(len(validated_contracts)))
    
print({k: len(v) for k,v in validated_checks.items()})
