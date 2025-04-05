# ip-flows
A lightweight C project that demonstrates how to create and manage network flows from packets in a PCAP file using the [`uthash`](https://troydhanson.github.io/uthash/) hash table library.

## Overview
This tool reads packets from a given PCAP file using `libpcap`, extracts flow keys based on IP (and optionally transport layer) headers, and tracks unique flows in a hash table.

It is designed to explore the use of `uthash` for efficiently managing and looking up flow records derived from real network traffic.

## Flow Key Options
- **Without `USE_L4` flag:**  
  Tracks flows using 3-tuples:
  ```bash
  {Source IP, Destination IP, Protocol}
  ```
- **With `USE_L4` flag:**  
 Tracks flows using full 5-tuples:
 ```bash
 {Source IP, Destination IP, Source Port, Destination Port, Protocol}
 ```
Make sure you clone with --recursive-submodules option.
If you have already cloned without --recursive-submodeule run below command to retrive uthash repo -
```bash
git submodule update --init --recursive
```
> For each flow, ports and IPs are normalized (sorted) so that reverse directions are considered part of the same flow.

## Features
- Reads network packets from a `.pcap` file.
- Extracts flow keys based on:
  - Source & destination IP addresses
  - Protocol (TCP/UDP)
  - (Optional) Source & destination ports (`USE_L4` flag)
- Tracks unique flows using `uthash`.
- Provides lookup support for finding specific flows.
- Prints a flow summary and total packets processed.

## Usage
```bash
ip-flows > ./build/ip_flows data/en0_capture.pcap
Key [17827032, 9301a8c0, 443, 55879, 6]:  Value - TCP  50.112.130.23:443 -> 192.168.1.147:55879. Count - 247
Key [101a8c0,  9301a8c0, 53,  60135, 17]: Value - UDP  192.168.1.1:53 -> 192.168.1.147:60135.    Count - 1
Key [8080808,  9301a8c0, 53,  53614, 17]: Value - UDP  8.8.8.8:53 -> 192.168.1.147:53614.        Count - 2
Key [101a8c0,  9301a8c0, 53,  59356, 17]: Value - UDP  192.168.1.1:53 -> 192.168.1.147:59356.    Count - 1
Key [8080808,  9301a8c0, 53,  51508, 17]: Value - UDP  8.8.8.8:53 -> 192.168.1.147:51508.        Count - 2
Key [101a8c0,  9301a8c0, 53,  54583, 17]: Value - UDP  192.168.1.1:53 -> 192.168.1.147:54583.    Count - 2
Key [101a8c0,  9301a8c0, 53,  58930, 17]: Value - UDP  192.168.1.1:53 -> 192.168.1.147:58930.    Count - 2

```

**Tip**: _To explore the flow hashing and lookup logic, see find_flow() and add_flow() in main.c_
