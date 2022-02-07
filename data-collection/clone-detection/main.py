#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import pprint
import ssdeep

from fuzzywuzzy import fuzz
from solidity_parser import parser

class colors:
    INFO = '\033[94m'
    OK = '\033[92m'
    FAIL = '\033[91m'
    END = '\033[0m'

def remove_comments(string):
    pattern = r"(\".*?\"|\'.*?\')|(/\*.*?\*/|//[^\r\n]*$)"
    # first group captures quoted strings (double or single)
    # second group captures comments (//single-line or /* multi-line */)
    regex = re.compile(pattern, re.MULTILINE|re.DOTALL)

    def _replacer(match):
        # if the 2nd group (capturing comments) is not None,
        # it means we have captured a non-quoted (real) comment string.
        if match.group(2) is not None:
            return ""  # so we will return empty to remove the comment
        else:  # otherwise, we will return the 1st group
            return match.group(1) # captured quoted-string
    return regex.sub(_replacer, string)

global IDENTIFIERS
IDENTIFIERS = dict()

def parse_child(child):
    global IDENTIFIERS

    if child == None:
        return ""

    if child.type == "PragmaDirective":
        return ""

    if child.type == "ContractDefinition":
        base = ""
        for i in range(len(child.baseContracts)):
            base_contract = child.baseContracts[i]
            if i == 0:
                base += " is "
            base_name = parse_child(base_contract)
            if not base_name in IDENTIFIERS:
                IDENTIFIERS[base_name] = child.kind[0]
            base += IDENTIFIERS[base_name]
            if i != 0 and i < len(child.baseContracts) - 1:
                base += ","
        if not child.name in IDENTIFIERS:
            IDENTIFIERS[child.name] = child.kind[0]
        contract_definition = child.kind + " " + IDENTIFIERS[child.name] + base + "{"
        for sub_node in child.subNodes:
            contract_definition += parse_child(sub_node)
        return contract_definition + "}"

    if child.type == "InheritanceSpecifier":
        return parse_child(child.baseName)

    if child.type == "UserDefinedTypeName":
        return child.namePath

    if child.type == "FunctionDefinition":
        if "function()" in child.name:
            function_definition = "function fallback("
        elif child.name in IDENTIFIERS:
            function_definition = "constructor("
        else:
            if not child.name in IDENTIFIERS:
                IDENTIFIERS[child.name] = "f"
            function_definition = "function " + IDENTIFIERS[child.name] + "("
        function_definition += parse_child(child.parameters) + ")"
        for modifier in child.modifiers:
            function_definition += " " + parse_child(modifier)
        if child.returnParameters:
            function_definition += "returns("
            function_definition += parse_child(child.returnParameters)
            function_definition += ")"
        function_definition += "{"
        if child.body:
            for statement in child.body.statements:
                function_definition += parse_child(statement)
        function_definition += "}"
        return function_definition

    if child.type == "FunctionCall":
        function_call = parse_child(child.expression) + "("
        for i in range(len(child.arguments)):
            argument = child.arguments[i]
            function_call += parse_child(argument)
            if i < len(child.arguments) - 1:
                 function_call += ","
        function_call += ")"
        return function_call

    if child.type == "ModifierDefinition":
        if not child.name in IDENTIFIERS:
            IDENTIFIERS[child.name] = "m"
        modifier_definition = "modifier " + IDENTIFIERS[child.name] + "("
        if child.parameters:
            modifier_definition += parse_child(child.parameters)
        modifier_definition += "){"
        for statement in child.body.statements:
            modifier_definition += parse_child(statement)
        modifier_definition += "}"
        return modifier_definition

    if child.type == "ModifierInvocation":
        if not child.name in IDENTIFIERS:
            IDENTIFIERS[child.name] = "m"
        modifier_invocation = IDENTIFIERS[child.name] + "("
        for argument in child.arguments:
            modifier_invocation += parse_child(argument)
        modifier_invocation += ")"
        return modifier_invocation

    if child.type == "VariableDeclarationStatement":
        variable_declaration = ""
        for variable in child.variables:
            if child.initialValue:
                variable_declaration += parse_child(variable) + "=" + parse_child(child.initialValue) + ";"
            else:
                variable_declaration += parse_child(variable) + ";"
        return variable_declaration

    if child.type == "StateVariableDeclaration":
        for variable in child.variables:
            parse_child(variable)
        return ""

    if child.type == "VariableDeclaration":
        variable_name = child.name
        if not variable_name in IDENTIFIERS.keys():
            IDENTIFIERS[variable_name] = parse_child(child.typeName)
        return IDENTIFIERS[variable_name]

    if child.type == "IndexAccess":
        variable_name = parse_child(child.base)
        if not variable_name in IDENTIFIERS.keys() and not variable_name in IDENTIFIERS.values():
            IDENTIFIERS[variable_name] = "mapping"
        if variable_name in IDENTIFIERS.keys():
            return IDENTIFIERS[variable_name] + "[" + parse_child(child.index) + "]"
        return "mapping" + "[" + parse_child(child.index) + "]"

    if child.type == "MemberAccess":
        return parse_child(child.expression) + "." + child.memberName

    if child.type in ["Identifier", "ElementaryTypeName"]:
        if child.name in IDENTIFIERS:
            return IDENTIFIERS[child.name]
        if child.type == "Identifier":
            IDENTIFIERS[child.name] = "uint"
            return IDENTIFIERS[child.name]
        return child.name

    if child.type == "ExpressionStatement":
        return parse_child(child.expression) + ";"

    if child.type == "IfStatement":
        if child.FalseBody:
            return "if(" + parse_child(child.condition) + "){" + parse_child(child.TrueBody) + "}else{" + parse_child(child.FalseBody) + "}"
        else:
            return "if(" + parse_child(child.condition) + "){" + parse_child(child.TrueBody) + "}"

    if child.type == "Block":
        block = ""
        for statement in child.statements:
            block += parse_child(statement)
        return block

    if child.type == "BinaryOperation":
        return parse_child(child.left) + child.operator + parse_child(child.right)

    if child.type == "NumberLiteral":
        if child.subdenomination:
            return child.number + child.subdenomination
        return child.number

    if child.type == "stringLiteral":
        return "stringLiteral"

    if child.type == "EmitStatement":
        return parse_child(child.eventCall)

    if child.type == "TupleExpression":
        tuple_expression = "("
        for component in child.components:
            tuple_expression += parse_child(component)
        tuple_expression += ")"
        return tuple_expression

    if child.type == "ArrayTypeName":
        array_name = parse_child(child.baseTypeName) + "["
        if child.length:
            array_name += child.length
        array_name += "]"
        return array_name

    if child.type == "UnaryOperation":
        if child.isPrefix:
            return child.operator + parse_child(child.subExpression)
        else:
            return parse_child(child.subExpression) + child.operator

    if child.type == "BooleanLiteral":
        return str(child.value)

    if child.type == "EnumDefinition":
        enum_definition = "enum " + child.name + "{"
        for i in range(len(child.members)):
            member = child.members[i]
            enum_definition += parse_child(member)
            if i < len(child.members) - 1:
                enum_definition += ","
        enum_definition += "}"
        return enum_definition

    if child.type == "EnumValue":
        return child.name

    if child.type == "EventDefinition":
        return "event " + child.name + "(" + parse_child(child.parameters) + ");"

    if child.type == "ParameterList":
        parameters = ""
        for i in range(len(child.parameters)):
            parameter = child.parameters[i]
            parameter_name = parameter.name
            if not parameter_name in IDENTIFIERS.keys():
                IDENTIFIERS[parameter_name] = parse_child(parameter.typeName)
            parameters += IDENTIFIERS[parameter_name]
            if i < len(child.parameters) - 1:
                parameters += ","
        return parameters

    if child.type == "StructDefinition":
        struct_definition = "struct "
        struct_name = child.name
        if not struct_name in IDENTIFIERS.keys():
            IDENTIFIERS[struct_name] = "s"
        struct_definition += IDENTIFIERS[struct_name] + "{"
        for member in child.members:
            struct_definition += parse_child(member) + ";"
        struct_definition += "}"
        return struct_definition

    if child.type == "Mapping":
        return "mapping(" + parse_child(child.keyType) + "=>" + parse_child(child.valueType) + ")"

    if child.type == "NewExpression":
        return "new " + parse_child(child.typeName)

    if child.type == "ForStatement":
        return "for(" + parse_child(child.initExpression) + parse_child(child.conditionExpression) + ";" + parse_child(child.loopExpression) + "){" + parse_child(child.body) + "}"

    if child.type == "CustomErrorDefinition":
        return "error " + parse_child(child.name) + "(" + parse_child(child.parameterList) + ");"

    if child.type == "RevertStatement":
        return "revert " + parse_child(child.functionCall) + ";"

    else:
        print(colors.FAIL)
        print("Unknown type", child.type)
        pprint.pprint(child)
        print(colors.END)
        return ""

def get_fingerprint(filename):
    global IDENTIFIERS
    IDENTIFIERS = dict()

    with open(filename, "r") as f:
        snippet = f.read()
        #print(snippet)
        source_unit = parser.parse(remove_comments(snippet).replace('\n', ''), loc=False)
        normalized_source_code = ""
        for child in source_unit.children:
            normalized_source_code += parse_child(child)
        #print()
        #print(normalized_source_code)

        context_triggered_piecewise_hash = ""
        sequence = ""
        for character in normalized_source_code:
            sequence += character
            if character in ["{", ";", "}"]:
                hash = ssdeep.hash(sequence).split(":")[1]
                if len(hash) > 2:
                    #print(sequence, hash)
                    context_triggered_piecewise_hash += hash
                sequence = ""
        print(len(context_triggered_piecewise_hash), "/", len(normalized_source_code), 100-len(context_triggered_piecewise_hash)/len(normalized_source_code)*100)
        return context_triggered_piecewise_hash

def main():
    fp1 = get_fingerprint("examples/test.sol")
    print(fp1)

    fp2 = get_fingerprint("examples/s0.sol")
    print(fp2)

    fp3 = get_fingerprint("examples/s1.sol")
    #fp3 = "aaaaaaaaaaaaaaaaaaaaaaaaaa" + fp3 + "dbdhdghgdhgdhggdhghdgsgdhsghdghgdhgd"
    print(fp3)

    fp4 = get_fingerprint("examples/s2.sol")
    print(fp4)

    fp5 = get_fingerprint("examples/s3.sol")
    print(fp5)

    fp6 = get_fingerprint("examples/s4.sol")
    print(fp6)

    print()

    print("clone", "\t\t", 0.9768, fuzz.partial_ratio(fp1, fp2), fuzz.ratio(fp1, fp2), fuzz.token_sort_ratio(fp1, fp2), fuzz.token_set_ratio(fp1, fp2))
    print("clone", "\t\t", 0.9747, fuzz.partial_ratio(fp1, fp3), fuzz.ratio(fp1, fp3), fuzz.token_sort_ratio(fp1, fp3), fuzz.token_set_ratio(fp1, fp3))
    print("clone", "\t\t", "0.953 ", fuzz.partial_ratio(fp1, fp4), fuzz.ratio(fp1, fp4), fuzz.token_sort_ratio(fp1, fp4), fuzz.token_set_ratio(fp1, fp4))
    print("no-clone", "\t", 0.9005, fuzz.partial_ratio(fp1, fp5), fuzz.ratio(fp1, fp5), fuzz.token_sort_ratio(fp1, fp5), fuzz.token_set_ratio(fp1, fp5))
    print("no-clone", "\t", 0.8957, fuzz.partial_ratio(fp1, fp6), fuzz.ratio(fp1, fp6), fuzz.token_sort_ratio(fp1, fp6), fuzz.token_set_ratio(fp1, fp6))


    fp7 = get_fingerprint("examples/large.sol")
    print(fp7)

    fp8 = get_fingerprint("examples/small.sol")
    print(fp8)

    print(fuzz.partial_ratio(fp8, fp7), fuzz.ratio(fp8, fp7), fuzz.token_sort_ratio(fp8, fp7), fuzz.token_set_ratio(fp8, fp7))
    print(fuzz.partial_ratio(fp8, fp5), fuzz.ratio(fp8, fp5), fuzz.token_sort_ratio(fp8, fp5), fuzz.token_set_ratio(fp8, fp5))


    fp9 = get_fingerprint("examples/test3.sol")
    print(fp9)


if __name__ == "__main__":
    main()
