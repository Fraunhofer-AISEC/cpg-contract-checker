#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import numpy
import scipy
import shutil
import warnings

class colors:
    INFO = "\033[94m"
    OK = "\033[92m"
    FAIL = "\033[91m"
    END = "\033[0m"

SNIPPETS_DATASET = [
    ("stack_overflow", "stack_overflow/successfully_parsed"),
    ("ethereum_stack_exchange", "ethereum_stack_exchange/successfully_parsed")
]

def main():
    warnings.simplefilter(action="ignore", category=FutureWarning)

    all_snippets = list()
    for dataset_name, dataset_path in SNIPPETS_DATASET:
        lengths = list()
        total_snippets = list()
        filtered_snippets = list()
        for path, _, files in os.walk(dataset_path):
            for name in files:
                if name.endswith(".sol"):
                    with open(os.path.join(path, name), "r") as file:
                        total_snippets.append(os.path.join(path, name))
                        content = file.read()
                        length = len(content.replace("\r", "").replace("\n", "").replace(" ", ""))
                        lengths.append(length)
                        filtered_snippets.append(os.path.join(path, name))
                        """if length >= 100:
                            filtered_snippets.append(os.path.join(path, name))
                        else:
                            strings = list()
                            strings += re.findall('\"(.*?)\"', content)
                            strings += re.findall("\'(.*?)\'", content)
                            for s in strings:
                                content = content.replace(s, "")
                            if any([True for x in ["+", "-", ".call", "now", "block.timestamp"] if x in content]):
                                filtered_snippets.append(os.path.join(path, name))"""
        all_snippets += filtered_snippets
        duplicates = dict()
        for snippet in filtered_snippets:
            with open(snippet, "r") as file:
                content = file.read().replace("\r", "").replace("\n", "").replace(" ", "")
                if not content in duplicates:
                    duplicates[content] = list()
                duplicates[content].append(snippet)
        print()
        print("Dataset name: "+colors.INFO+dataset_name.replace("_", " ").title()+colors.END)
        print("Total number of snippets: "+colors.INFO+str(len(total_snippets))+colors.END)
        print("Total number of snippets after filtering: "+colors.INFO+str(len(filtered_snippets)), "("+str((len(total_snippets) - len(filtered_snippets)) / len(total_snippets) * 100.0)+"% filtered)"+colors.END)
        print("Total number of snippets after removing duplicates: "+colors.INFO+str(len(duplicates.keys())), "("+str((len(total_snippets) - len(duplicates.keys())) / len(total_snippets) * 100.0)+"% duplicates)"+colors.END)
        print("Max number of characters per snippet: "+colors.INFO+str(numpy.max(lengths))+colors.END)
        print("Mean number of characters per snippet: "+colors.INFO+str(numpy.mean(lengths))+colors.END)
        print("Median number of characters per snippet: "+colors.INFO+str(numpy.median(lengths))+colors.END)
        print("Mode number of characters per snippet: "+colors.INFO+str(scipy.stats.mode(lengths)[0][0]), "("+str(scipy.stats.mode(lengths)[1][0])+" snippets)"+colors.END)
        print("Min number of characters per snippet: "+colors.INFO+str(numpy.min(lengths))+colors.END)

    print()
    print("Total snippets after filtering: "+colors.INFO+str(len(all_snippets))+colors.END)
    duplicates = dict()
    for snippet in all_snippets:
        with open(snippet, "r") as file:
            content = file.read().replace("\r", "").replace("\n", "").replace(" ", "")
            if not content in duplicates:
                duplicates[content] = list()
            duplicates[content].append(snippet)
    for _, dataset_path in SNIPPETS_DATASET:
        filtered_path = dataset_path.replace("successfully_parsed", "successfully_parsed_filtered")
        if not os.path.exists(filtered_path):
            os.mkdir(filtered_path)
    for duplicate in duplicates:
        src_path = duplicates[duplicate][0]
        dst_path = duplicates[duplicate][0].replace("successfully_parsed", "successfully_parsed_filtered")
        shutil.copy(src_path, dst_path)
    print("Total snippets after removing duplicates: "+colors.INFO+str(len(duplicates.keys()))+colors.END)
    print()

if __name__ == "__main__":
    main()
