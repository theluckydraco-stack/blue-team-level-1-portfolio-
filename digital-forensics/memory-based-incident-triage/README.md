# Memory-Based Incident Triage with Volatility

## Objective

This project combines two completed memory-forensics exercises into one operational workflow:

**How can volatile memory be used to identify suspicious process activity, add execution and network context, and extract artifacts for further investigation?**

The work uses separate controlled memory images. It is presented as a memory-triage methodology, not as one continuous incident or a reproduction of course questions.

## Tools and Evidence

- Volatility Framework 2.6.1 — legacy profile-based memory analysis
- Volatility 3 Framework 2.4.1
- PassMark Volatility Workbench V3.0 Build 1005
- Linux command-line utilities for filtering and hashing
- Multiple supplied Windows memory images used in controlled training exercises

The raw memory images are not included in this repository.

## Investigative Workflow

Memory image → establish image/system context → enumerate processes → inspect parent-child relationships → recover command-line context → inspect network activity or token privileges → extract suspicious process artifacts where justified → hash and document outputs → correlate with endpoint and network telemetry.

## 1. Establish the Analysis Context

The legacy Volatility 2 exercise began with image identification so the correct Windows profile could be selected before other plugins were trusted.

Volatility 3 removes that profile-selection workflow and instead uses its symbol-based framework. In Workbench, system information was recovered directly from the image before deeper process analysis.

Operational question: **What system produced this memory image, and can the framework interpret its structures correctly?**

## 2. Build the Process Baseline

Process enumeration was used to establish what was represented in memory at capture time.

The analysis then moved beyond process names to relationships. A normal-looking executable can become more significant when its parent or child processes are unexpected.

The useful progression is: process name → PID/PPID → parent-child relationship → command-line context.

This is more useful than classifying a process as suspicious from its name alone.

## 3. Add Command-Line Context

Command-line analysis was used to recover arguments associated with selected processes.

This matters because executables such as command shells or PowerShell can be entirely legitimate. Their arguments provide the context needed to understand what they were asked to do.

Operational question: **What was the process actually launched to execute?**

## 4. Examine Network Activity

Memory-resident network structures were used to associate process activity with external endpoints.

The exercise demonstrated how a process-to-network relationship can become a pivot for DNS and proxy searches, firewall and EDR correlation, threat-intelligence checks, and broader endpoint hunting.

A process associated with an external connection is an investigative lead. It does not by itself prove that malware was downloaded or that the remote endpoint was malicious.

## 5. Inspect Process Privileges

Volatility 3 was used to inspect privileges present in a selected process token.

This provides capability context: privilege present means the process token contains that capability; it does not prove the privilege was actually exercised.

## 6. Extract and Hash a Process Artifact

A selected process image was dumped from memory and hashed.

Operationally: suspicious process → extract artifact → calculate cryptographic hash → use as a stable identifier.

The hash can support comparison across systems, malware-analysis tooling, EDR searches, and case documentation.

Where a training task used MD5 for compatibility, SHA-256 was also retained as the stronger modern identifier.

## Volatility 2 vs Volatility 3

The two exercises also demonstrated the practical transition between framework generations.

| Area | Volatility 2 | Volatility 3 |
|---|---|---|
| Image interpretation | Manual profile selection | Symbol-based framework |
| Plugin naming | Generic names such as pstree | OS-specific names such as windows.pstree |
| Interface used | Command line | Workbench GUI over Volatility 3 |
| Investigative reasoning | Same | Same |

The syntax changed. The investigative questions did not.

## Operational Lessons

### Process relationships matter more than names alone

A common Windows executable should not be treated as benign or malicious solely by filename. Parent process, child process, command line, path, modules, user context, and network behaviour provide the useful context.

### Memory can retain evidence not obvious on disk

Volatile memory may preserve running processes, command lines, network structures, and other runtime information that can disappear after shutdown.

### A network connection is a pivot, not a verdict

Memory can associate a process with an endpoint, but additional telemetry is needed to establish what was transferred, why the connection occurred, and whether the endpoint was malicious.

### Privilege presence is not privilege use

Token inspection shows what a process may be allowed to do. It does not prove that the capability was exercised.

### Extraction should lead to further analysis

Dumping a process is not the end of the investigation. The extracted artifact should be hashed, preserved, and examined with additional static, dynamic, endpoint, and threat-intelligence evidence where appropriate.

## Evidence Boundaries and Limitations

This project is based on separate controlled training images and should not be read as one incident timeline.

The retained evidence supports the demonstrated analysis methods, but:

- source memory-image hashes were not available for every image;
- acquisition tools, capture metadata, and complete custody records were not supplied;
- only selected plugin outputs were retained;
- process and network anomalies do not independently prove maliciousness;
- the raw memory images and extracted binaries are not published here;
- one Volatility 3 process name was visibly truncated in the output and is preserved without silently expanding it.

## Skills Demonstrated

- Windows memory-image triage
- Volatility 2 profile identification
- Volatility 3 / Workbench analysis
- process enumeration
- parent-child process analysis
- command-line recovery
- network-connection triage
- token-privilege interpretation
- process extraction
- MD5 and SHA-256 artifact hashing
- evidence-versus-conclusion reasoning
- development of pivots for EDR, DNS, proxy, firewall, and endpoint investigation

## Next Investigative Step

Memory findings are strongest when correlated with persistent endpoint evidence.

The next Digital Forensics work will continue toward Windows Endpoint Artifact Reconstruction and later disk/timeline analysis, allowing process and network leads from memory to be tested against Prefetch, LNK files, browser artifacts, Recycle Bin evidence, event logs, and disk artifacts.
