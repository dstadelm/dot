#!/usr/bin/env python3

import argparse
import getpass

import requests


def main():
    args = parse_command_line_arguments()
    json_data = get_json(user=args.u, issue=args.issue)
    print_info(json_data)


def parse_command_line_arguments():
    parser = argparse.ArgumentParser()
    parser.add_argument("issue")
    parser.add_argument(
        "-u",
        default="dstadelmann",
        help="user",
    )
    return parser.parse_args()


def get_json(user: None, issue: None):
    # jira_json = requests.get('https://tools.scs.ch/issues/rest/api/latest/search?jql=filter=WP9',
    #                         auth=('dstadelmann', getpass()))
    return requests.get(
        f"https://tools.scs.ch/issues/rest/api/latest/issue/{issue}",
        auth=(f"{user}", getpass.getpass()),
    ).json()


def print_info(json_data: None):
    issue = json_data["key"]
    description = json_data["fields"]["description"]
    summary = json_data["fields"]["summary"]
    print(f"{issue}: {summary}")
    print("")
    print(description)


if __name__ == "__main__":
    main()
