# uthash-flows

This project demonstrates how to use the [uthash](https://troydhanson.github.io/uthash/) library to manage flow records derived from a pcap file. It reads packets using `libpcap`, extracts flow keys from the IP (and optionally TCP/UDP) headers, and stores them in a hash table using `uthash`.

uthash is being used and its added as a sub-module.
Make sure you clone with --recursive-submodules option.

If you have already cloned without --recursive-submodeule run below command to retrive uthash repo -
```bash
git submodule update --init --recursive
```

## Features

- Reads network packets from a `.pcap` file.
- Extracts flow keys based on:
  - Source & destination IP addresses
  - Protocol (TCP/UDP)
  - (Optional) Source & destination ports (`USE_L4` flag)
- Tracks unique flows using `uthash`.
- Provides lookup support for finding specific flows.
- Prints a flow summary and total packets processed.

