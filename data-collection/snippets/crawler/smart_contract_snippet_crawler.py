#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import time
import math
import copy
import pymongo
import requests

from tqdm import tqdm
from bs4 import BeautifulSoup

STACK_EXCHANGE_API_KEY = "U4DMV*8nvpm3EOpvf69Rxw(("

MONGO_HOST = "sectrs-vascodagama"
MONGO_PORT = 27017
MONGO_DATABASE = "smart_contract_snippets"

SITES = [
    ["Stack Overflow", "stackoverflow", "stack_overflow_posts"],
    ["Ethereum Stack Exchange", "ethereum", "ethereum_stack_exchange_posts"]
]

HEADERS = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:104.0) Gecko/20100101 Firefox/104.0"
}

def get_code_snippets(link):
    time.sleep(1)
    valid_code_snippets = list()
    html_content = requests.get(link).text
    soup = BeautifulSoup(html_content, 'html.parser')
    pre_elements = soup.find_all('pre')
    for pre_element in pre_elements:
        code_elements = pre_element.find_all('code')
        for code_element in code_elements:
            if "function" in code_element.text or "contract" in code_element.text or " = " in code_element.text:
                valid_code_snippets.append(code_element.text)
    return valid_code_snippets

def main():
    mongo_connection = pymongo.MongoClient("mongodb://"+MONGO_HOST+":"+str(MONGO_PORT))

    for site in SITES:
        # Get number of existing posts for the tag "solidity" on stack overflow
        tag_info = requests.get("https://api.stackexchange.com/2.3/tags/solidity/info?key="+STACK_EXCHANGE_API_KEY+"&site="+site[1], headers=HEADERS).json()
        print(site[0], "has", tag_info["items"][0]["count"], "posts for the tag", "'"+tag_info["items"][0]["name"]+"'.")

        # Search for those posts on stack overflow page by page (page size limit is 100)
        print("Crawling", site[0], "for posts related to Solidity...")
        try:
            for page in tqdm(range(1, int(math.ceil(int(tag_info["items"][0]["count"]) / 100)) + 1)):
                url = "https://api.stackexchange.com/2.3/search?key="+STACK_EXCHANGE_API_KEY+"&page="+str(page)+"&pagesize=100&order=asc&sort=creation&tagged=solidity&site="+site[1]
                search_result = requests.get(url, headers=HEADERS).json()
                for item in search_result["items"]:
                    # Check if stack overflow post already exists
                    exists = mongo_connection[MONGO_DATABASE][site[2]].find_one({"question_id": item["question_id"]})
                    if not exists:
                        # Get code snippets from stack overflow page
                        code_snippets = get_code_snippets(item["link"])
                        post = copy.copy(item)
                        post["code_snippets"] = code_snippets
                        # Save information to mongo
                        collection = mongo_connection[MONGO_DATABASE][site[2]]
                        collection.insert_one(post)
                        # Indexing...
                        if 'question_id' not in collection.index_information():
                            collection.create_index('question_id', unique=True)
                            collection.create_index('tags')
                            collection.create_index('owner.account_id')
                            collection.create_index('owner.reputation')
                            collection.create_index('owner.user_id')
                            collection.create_index('owner.user_type')
                            collection.create_index('owner.accept_rate')
                            collection.create_index('owner.profile_image')
                            collection.create_index('owner.display_name')
                            collection.create_index('owner.link')
                            collection.create_index('is_answered')
                            collection.create_index('view_count')
                            collection.create_index('accepted_answer_id')
                            collection.create_index('answer_count')
                            collection.create_index('score')
                            collection.create_index('last_activity_date')
                            collection.create_index('creation_date')
                            collection.create_index('last_edit_date')
                            collection.create_index('content_license')
                            collection.create_index('link')
                            collection.create_index('title')
        except:
            print("Error:", search_result)
            print("URL:", url)
        # Compute the remaining quota
        quota_max = int(search_result["quota_max"])
        quota_remaining = int(search_result["quota_remaining"])
        print("Quota used: %.2f%% (quota max %d, quota remaining %d)" % ((quota_remaining / quota_max), quota_max, quota_remaining))
        print()

if '__main__' == __name__:
    main()
