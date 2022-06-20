#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import csv
import json

from antlr4 import *
from antlr4.error.ErrorListener import ErrorListener

from antlr.FuzzySolidityLexer import FuzzySolidityLexer
from antlr.FuzzySolidityParser import FuzzySolidityParser

from collections import OrderedDict

global errors

DATASETS = [
    ["stack_overflow", "../stack-overflow-data/stack_overflow_posts.json"],
    ["ethereum_stack_exchange", "../stack-overflow-data/ethereum_stack_exchange_posts.json"]
]


class CustomErrorListener(ErrorListener):
    def syntaxError(self, recognizer, offendingSymbol, line, column, msg, e):
        global errors

        if msg not in errors:
            errors[msg] = list()
        errors[msg].append("ERROR: when parsing line %d column %d: %s\n" % (line, column, msg))


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


def remove_special_characters(strings):
    special_characters = ["=", ":", "_", r"\r", r"\n", "-", "?", "*"]
    return set([s for s in strings if not any([True for c in special_characters if c in s])])

def main():
    global errors

    with open("antlr/JavaScript.g4", "r") as f:
        javascript_grammar = f.read()
        javascript_grammar = remove_comments(javascript_grammar)
        javascript_keywords = set(re.compile("'(.*?)'").findall(javascript_grammar))
        print("JavaScript Keywords: %d" % len(javascript_keywords))

    with open("antlr/FuzzySolidity.g4", "r") as f:
        solidity_grammar = f.read()
        solidity_grammar = remove_comments(solidity_grammar)
        solidity_keywords = set(re.compile("'(.*?)'").findall(solidity_grammar))
        solidity_keywords = remove_special_characters(solidity_keywords)
        print("Solidity Keywords: %d" % len(solidity_keywords))

    solidity_keywords.difference_update(javascript_keywords)
    solidity_keywords.remove("contract")
    solidity_keywords.remove("address")
    print("Solidity Keywords after removing intersection with JavaScript: %d" % len(solidity_keywords))
    print()

    for dataset in DATASETS:
        print("Analyzing '"+dataset[0]+"' dataset.")
        print()
        # Load snippets into memory
        snippets = list()
        totel_posts = 0
        total_snippets = 0
        with open(dataset[1], "r") as f:
            lines = f.readlines()
            for line in lines:
                post = json.loads(line)
                totel_posts += 1
                for i in range(len(post["code_snippets"])):
                    snippet = remove_comments(post["code_snippets"][i])
                    total_snippets += 1
                    if any([True for s in snippet.split() if s in solidity_keywords]):
                        # Ignore snippets with certain keywords
                        if not any([True for s in ["web3", "truffle", "console", "then"] if s in snippet]):
                            snippet_id = str(post["question_id"]) + "_" + str(i)
                            snippets.append((snippet_id, snippet))
        print("Total posts:", totel_posts)
        print("Total code snippets:", total_snippets)
        print("Parsing %d code snippets:" % (len(snippets)))

        success, failed = 0, 0
        total_errors = dict()
        for snippet in snippets:
            print(snippet[0])

            # Run the lexer (create tokens)
            lexer = FuzzySolidityLexer(InputStream(snippet[1]))
            stream = CommonTokenStream(lexer)

            # Run the parser (create AST)
            parser = FuzzySolidityParser(stream)
            parser.removeErrorListeners()
            parser.addErrorListener(CustomErrorListener())
            errors = dict()
            parser.sourceUnit()

            if len(errors) == 0:
                path = "./"+dataset[0]+"/successfully_parsed"
                if not os.path.exists(path):
                    os.makedirs(path)
                if not os.path.exists(path + "/" + str(snippet[0]) + ".sol"):
                    with open(path + "/" + str(snippet[0]) + ".sol", "w") as f:
                        f.write(snippet[1])
                success += 1
            else:
                parsing_error_solved = False
                for msg in errors:
                    if msg == "missing '}' at '<EOF>'":
                        for error in errors[msg]:
                            line_number = int(re.compile("line (.+?) column").findall(error)[0])
                            column_number = 1
                            lines = snippet[1].split("\n")
                            line = lines[line_number - 1]
                            line = line[:column_number] + "}" + line[column_number:]
                            lines[line_number - 1] = line

                        # Run the lexer (create tokens)
                        lexer = FuzzySolidityLexer(InputStream("\n".join(lines)))
                        stream = CommonTokenStream(lexer)

                        # Run the parser (create AST)
                        parser = FuzzySolidityParser(stream)
                        parser.removeErrorListeners()
                        parser.addErrorListener(CustomErrorListener())
                        errors = dict()
                        parser.sourceUnit()

                        if len(errors) == 0:
                            path = "./"+dataset[0]+"/successfully_parsed"
                            if not os.path.exists(path):
                                os.makedirs(path)
                            if not os.path.exists(path + "/" + str(snippet[0]) + ".sol"):
                                with open(path + "/" + str(snippet[0]) + ".sol", "w") as f:
                                    f.write("\n".join(lines))
                            success += 1
                            parsing_error_solved = True

                if not parsing_error_solved:
                    path = "./"+dataset[0]+"/failed_parsing"
                    if not os.path.exists(path):
                        os.makedirs(path)
                    if not os.path.exists(path + "/" + str(snippet[0]) + ".sol"):
                        with open(path + "/" + str(snippet[0]) + ".sol", "w") as f:
                            f.write(snippet[1])
                        with open(path + "/" + str(snippet[0]) + ".errors.json", "w") as f:
                            json.dump(errors, f, indent=4)
                    failed += 1

            for msg in errors:
                if msg not in total_errors:
                    total_errors[msg] = list()
                for _ in errors[msg]:
                    if snippet[0] not in total_errors[msg]:
                        total_errors[msg].append(snippet[0])

        print("%d code snippet(s) successfully parsed" % success)
        print("%d code snippet(s) failed to be parsed" % failed)

        total_errors = OrderedDict(sorted(total_errors.items(), key=lambda x:len(x[1]), reverse=True))
        with open("./"+dataset[0]+"/syntax_error_ranking.csv", mode="w") as f:
            writer = csv.writer(f, delimiter=',', quotechar='"', quoting=csv.QUOTE_MINIMAL)
            writer.writerow(["Rank", "Error Message", "Snippet IDs"])
            for msg in total_errors:
                writer.writerow([len(total_errors[msg]), msg, total_errors[msg]])


if __name__ == '__main__':
    main()
