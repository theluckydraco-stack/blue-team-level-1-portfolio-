# Disk Investigation and Artifact Reconstruction with Autopsy

## Investigative Question

**How can a forensic disk image be used to establish host context and reconstruct web, file, filesystem, and account activity without treating any single artifact as proof of a broader event?**

This project consolidates the final disk-analysis work from the Digital Forensics phase of my Blue Team Level 1 training into an operational investigation workflow. It is not a reproduction of course questions or answers.

## Evidence and Scope

The supplied evidence was an E01 image of a Windows laptop examined in a controlled training environment.

The retained evidence supports analysis of:

- operating-system and host information;
- browser download artifacts;
- recent-document / LNK evidence;
- the underlying filesystem;
- local account metadata and timestamps.

The source image, full case database, and a complete external chain-of-custody record are not published in this repository.

## Tools and Analysis Configuration

- **Autopsy 4.19.2**
- **Recent Activity ingest module**
- E01 forensic disk image
- Autopsy Data Artifacts, filesystem views, and OS Accounts

The Recent Activity module was intentionally selected for the exercise so that operating-system and browser artifacts could be extracted and organized for triage.

## Investigative Workflow

```text
E01 disk image
    ↓
Create case and add data source
    ↓
Run targeted ingest
    ↓
Establish OS / host context
    ↓
Review browser download artifacts
    ↓
Pivot into recent-document / LNK evidence
    ↓
Validate findings against the filesystem
    ↓
Review account metadata
    ↓
Correlate timestamps and document limits
```

## Findings

### 1. Host context

Autopsy recovered operating-system information identifying the image as a **Windows 8.1 Pro** system and exposed the system hostname through parsed OS artifacts.

Operationally, this establishes which endpoint and operating-system context the remaining artifacts belong to. In a production investigation, the hostname would become a pivot into EDR, SIEM, DNS, DHCP, Active Directory, proxy, or asset-inventory records.

### 2. Browser download activity

The Web Downloads artifacts showed multiple browser-mediated downloads. One timestamped record identified **ALL+COUPONS.rar** as a downloaded file. Another record preserved a MediaFire-origin download URL associated with a separate download.

The operational value is provenance:

```text
timestamp
+ local download path
+ source URL/domain
= browser-delivery lead
```

A browser-download record does **not** establish that the downloaded content was executed, opened, or malicious.

### 3. Recent-document / LNK evidence

Autopsy's Recent Documents artifacts identified a shortcut referencing:

```text
C:\Users\Craig\Pictures\Santa Monica\Pier.jpg
```

The corresponding source artifact was a Windows Recent-items LNK entry.

This is useful because a shortcut can retain target-path context even when the target is no longer where the examiner expects it. The artifact supports a relationship between Windows and the referenced file; it does not independently prove which human opened it or that the target still exists.

### 4. Filesystem validation

The analysis moved from parsed Results back into the underlying volume and filesystem rather than relying only on Autopsy's categorized output.

Navigating the main filesystem demonstrated how an examiner can validate paths, directories, allocation state, metadata, and surrounding context directly in the forensic image.

This distinction matters:

```text
Autopsy result
→ investigative lead

Underlying filesystem
→ source context / validation
```

### 5. Local account context

The OS Accounts view exposed the built-in Administrator account and recorded a **Last Login** timestamp of **2013-08-22 14:47:09 UTC**.

That timestamp is a useful timeline pivot, but it does not prove which person used the account or what activity occurred during that session. In a production Windows investigation, I would correlate it with Security event logs, session identifiers, EDR telemetry, and surrounding file/process activity.

## Evidence Screenshots

The screenshots below are selected tool-output evidence. Course question/answer screens are deliberately excluded.

### Ingest configuration

![Autopsy Recent Activity ingest configuration](images/autopsy-recent-activity-ingest.png)

### Operating-system information

![Autopsy operating-system information](images/autopsy-os-information.png)

### Hostname artifact

![Autopsy hostname artifact](images/autopsy-hostname.png)

### Browser download artifact

![Autopsy web-download artifact](images/autopsy-web-download-file.png)

### Browser download provenance

![Autopsy web-download URL artifact](images/autopsy-web-download-url.png)

### Recent-document path

![Autopsy Recent Documents artifact for Pier.jpg](images/autopsy-recent-document-pier.png)

### Filesystem examination

![Autopsy filesystem view in the GIMP directory](images/autopsy-filesystem-gimp.png)

### Administrator account metadata

![Autopsy OS Account view for the local Administrator account](images/autopsy-administrator-account.png)

## Operational Interpretation

The value of this workflow is not any single recovered value. It is the ability to move between artifact classes:

```text
Host identity
    ↓
browser activity
    ↓
file/path evidence
    ↓
filesystem context
    ↓
account context
    ↓
timeline pivots
```

Those pivots can then be tested against other evidence sources rather than converted directly into conclusions.

## Evidence Boundaries and Limitations

This was a controlled training investigation, not a production case.

The retained evidence does **not** establish:

- that any downloaded file was executed;
- that any URL or downloaded file was malicious;
- that a specific human performed the recorded activity;
- that the LNK target still existed at acquisition time;
- that an account timestamp describes every action performed during a session;
- a complete incident timeline.

The source-image acquisition record, independent source hash, complete case database, and external custody documentation were not available in the retained portfolio evidence.

## Production Follow-Up

If this were a real incident, the next justified actions would be:

- verify and preserve the source-image hash and acquisition record;
- export and retain relevant Autopsy artifacts in structured form;
- hash downloaded or recovered files and assess them separately;
- correlate download timestamps with browser history, Zone.Identifier, Prefetch, Amcache, event logs, PowerShell logging, EDR, DNS, proxy, and firewall telemetry;
- normalize timestamps before building a cross-source timeline;
- distinguish user-account attribution from human attribution.

## Interview Discussion Points

This project gives me concrete examples for discussing:

- why automated ingest is triage, not a conclusion;
- how browser download artifacts establish provenance but not execution;
- how LNK files preserve file/path context;
- why an examiner should pivot from parsed results back to the underlying filesystem;
- how account timestamps become correlation points rather than identity proof;
- how multiple weak artifacts can become useful when corroborated across sources.

## Skills Demonstrated

- Autopsy case creation and data-source ingestion
- E01 disk-image examination
- targeted ingest configuration
- Windows host-context recovery
- browser-download analysis
- LNK / Recent Documents interpretation
- filesystem navigation and validation
- Windows account-artifact interpretation
- timestamp correlation
- evidence-versus-inference discipline
- forensic reporting with explicit limitations

## References

- Autopsy User Documentation: https://sleuthkit.org/autopsy/docs/user-docs/
- The Sleuth Kit: https://www.sleuthkit.org/
