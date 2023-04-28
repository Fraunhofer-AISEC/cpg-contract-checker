#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import re
import sys
import csv
import json
import time
import shlex
import subprocess

class colors:
    INFO = "\033[94m"
    OK = "\033[92m"
    FAIL = "\033[91m"
    END = "\033[0m"

NGRAM_SIZE = 3
NGRAM_THRESHOLD = 1.0
LEVENSHTEIN_TRESHOLD = 1.0

MORPHEUS_PATH = "/Users/christof/ETH_Zurich/Projects/Morpheus/morpheus/morpheus.py"

ELASTICSEARCH_INDEX = "smart-contract-sanctuary-index"

#SNIPPETS_DATASET = "../../data-collection/snippets/parser/snippet_parser/stack_overflow/successfully_parsed"
SNIPPETS_DATASET = "../../data-collection/snippets/parser/snippet_parser/ethereum_stack_exchange/successfully_parsed"

def main():
    all_snippets = list()
    for path, _, files in os.walk(SNIPPETS_DATASET):
        for name in files:
            if name.endswith(".sol"):
                all_snippets.append(os.path.join(path, name))

    if not os.path.exists("matches"):
        os.makedirs("matches")

    analyzed_snippets = set()
    if not os.path.exists("stats.csv"):
        with open("stats.csv", "w") as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(["File Path", "N-gram Execution Time", "N-gram Retrieved Records", "Levenshtein Execution Time", "Levenshtein Retrieved Records"])
    else:
        with open("stats.csv", "r") as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                analyzed_snippets.add(row[0])

    for snippet in all_snippets:
        if not snippet in analyzed_snippets:
            print("Analyzing "+colors.INFO+snippet+colors.END)
            start = time.time()
            proc = subprocess.Popen(shlex.split("python3 "+MORPHEUS_PATH+" -m "+snippet+" --elasticsearch-index "+ELASTICSEARCH_INDEX+" --ngram-size "+str(NGRAM_SIZE)+" --ngram-threshold "+str(NGRAM_THRESHOLD)+" --levenshtein-threshold "+str(LEVENSHTEIN_TRESHOLD)+" --debug"), stdout=subprocess.PIPE, stderr=subprocess.PIPE)
            out, err = proc.communicate()
            with open("matches/"+snippet.split("/")[-1].replace(".sol", "")+".csv", "w") as csvfile:
                writer = csv.writer(csvfile)
                writer.writerow(["N-gram Similarity", "Levenshtein Similarity", "Contract Address", "File Path"])
                ngram_records, ngram_execution_time = 0, 0.0
                levenshtein_records, levenshtein_execution_time = 0, 0.0
                for line in out.decode("utf-8").split("\n"):
                    if "matching an n-gram threshold" in line:
                        ngram_records = line.split()[1].replace("\x1b[94m", "").replace("\x1b[0m", "")
                        ngram_execution_time = line.split()[4].replace("\x1b[94m", "").replace("\x1b[0m", "")
                    if "matching a levenshtein threshold" in line:
                        levenshtein_records = line.split()[1].replace("\x1b[94m", "").replace("\x1b[0m", "")
                        levenshtein_execution_time = line.split()[4].replace("\x1b[94m", "").replace("\x1b[0m", "")
                    matches = re.compile("[+-]?([0-9]*[.]?[0-9]+) .*? [+-]?([0-9]*[.]?[0-9]+) .*? ([a-fA-F0-9]{40}) .*? (.+)\/([^\/]+)").findall(line.replace("\t", ""))
                    if matches:
                        writer.writerow([matches[0][0], matches[0][1], "0x"+matches[0][2], matches[0][3]+"/"+matches[0][4]])
                with open("stats.csv", "a") as csvfile2:
                    writer2 = csv.writer(csvfile2)
                    writer2.writerow([snippet, ngram_execution_time, ngram_records, levenshtein_execution_time, levenshtein_records])
            if err:
                print(colors.FAIL+err.decode("utf-8")+colors.END)
            print("Analyzing "+colors.INFO+snippet+colors.END+" took:", colors.INFO+str(time.time() - start)+colors.END, "second(s).")

    print("Done.")

if __name__ == "__main__":
    main()
