# Forensic Evidence Acquisition and Recovery

## Objective

This project combines several controlled digital-forensics exercises into one operational workflow:

> **How can an examiner acquire, verify, classify, and examine digital evidence, then recover deleted content while preserving the limits of each method?**

The work focuses on evidence acquisition and recovery rather than on reproducing individual course labs.

## Scope

The workflow covers four acquisition and examination stages:

1. **Acquire evidence at the right scope** — whole-system memory, one process, a physical disk image, or a targeted artifact collection.
2. **Verify and identify the evidence** — use acquisition verification and filesystem classification before deeper analysis.
3. **Examine metadata and deleted content** — extract file metadata and recover content from raw storage when normal filesystem references are insufficient.
4. **Hash evidence and recovered artifacts** — use cryptographic digests as stable identifiers and integrity checks.

All activity was performed in controlled training environments.

## Tools Used

- **FTK Imager 4.5.0.3** — whole-memory capture, physical-disk imaging, filesystem inspection, image verification
- **ProcDump 11.0** — process-specific memory capture
- **KAPE 1.2.0.0** — rapid targeted artifact acquisition from a live/remote Windows host
- **ExifTool 12.80** — embedded metadata extraction
- **Scalpel 1.60** — signature-based file carving
- **PowerShell / Linux hashing utilities** — MD5, SHA-1, and SHA-256 generation for training and comparison

## Workflow

```text
Evidence source
    ↓
Choose acquisition scope
    ├── Whole RAM
    ├── Single process
    ├── Physical disk
    └── Targeted KAPE collection
    ↓
Verify acquisition where supported
    ↓
Identify filesystem
    ↓
Inspect metadata / filesystem structures
    ↓
Recover deleted content where justified
    ↓
Hash outputs
    ↓
Document findings, limits, and next actions
```

## 1. Acquisition

The acquisition exercise demonstrated four different collection scopes.

### Whole-system memory

FTK Imager was used to capture a live memory image from the analysis host. This preserves broad volatile state for later memory analysis.

### Process-specific memory

ProcDump was used with a selected PID to create a full dump of one process. This demonstrates a narrower collection method when an analyst already has a process-level lead.

### Physical disk imaging

FTK Imager was used to acquire a secondary physical drive into an E01 forensic image. The acquisition workflow produced matching internal verification records and reported no bad blocks.

### Targeted remote collection

KAPE was used on a remote Windows host to collect selected browser artifacts. This demonstrated fast triage collection while a full image may be unnecessary or still pending.

## 2. Filesystem Identification

Before examining file-level evidence, FTK Imager was used to identify the filesystem structures of supplied disk images.

Observed classifications included:

- NTFS
- FAT32
- Ext3

The operational purpose was not merely to name the filesystem. The filesystem determines which metadata structures, allocation mechanisms, deleted-file records, and recovery approaches are available during later examination.

## 3. Metadata and File Carving

ExifTool was used to inspect embedded metadata from document and image evidence.

Scalpel was then configured to search a disk image for known file signatures and successfully recover a deleted JPEG.

This demonstrated an important distinction:

- **Metadata analysis** provides context about an accessible file.
- **File carving** attempts to recover content from raw storage when the filesystem no longer provides a reliable reference.

Carving can recover file content without necessarily recovering the original filename, directory, ownership, or filesystem timestamps.

## 4. Hashing and Integrity

The exercises used MD5, SHA-1, and SHA-256 to demonstrate how exact input bytes map to repeatable digests.

The operational model is:

```text
Acquisition / evidence
      ↓
Generate reference digest
      ↓
Later verification
      ↓
Compare

Match
→ supports byte-for-byte consistency

Mismatch
→ investigate alteration, corruption, or acquisition error
```

SHA-256 is treated as the preferred modern security-relevant digest. MD5 and SHA-1 were retained where required by the training workflow or tool compatibility.

## Findings and Operational Lessons

### Acquisition scope should match the evidence question

A full disk image is not always the first or fastest answer. Volatile memory may disappear first, a process dump may preserve a focused lead, and targeted KAPE collection can provide rapid triage artifacts.

### Filesystem identification is a scoping step

Knowing whether evidence is NTFS, FAT32, or Ext3 determines the structures and recovery methods an examiner should expect.

### File carving recovers content, not necessarily context

A carved file can be valuable even when filesystem metadata is gone, but it may lose its original name, path, ownership, and timestamps.

### Hashes support integrity, not truthfulness

A matching digest supports that the measured bytes stayed the same. It does not prove that the original content was authentic or that the acquisition source was trustworthy.

### Triage acquisition does not replace comprehensive acquisition

KAPE is useful for collecting high-value artifacts quickly, but targeted collection can miss evidence outside the selected targets. A full image may still be required for a broader investigation.

## Evidence Boundaries and Limitations

This was a controlled training workflow, not a production forensic case.

The retained evidence supports the acquisition and examination methods described above, but several limitations remain:

- no complete external chain-of-custody record was available;
- write-blocker use was not independently documented for every source;
- SHA-256 was not recorded for every acquisition output;
- the underlying memory dump, process dump, E01 segments, and all parser exports were not retained in this repository;
- some earlier disk images lacked source/acquisition hashes;
- acquisition verification demonstrates consistency of the collected image, not authenticity of the source device;
- screenshots and lab outputs demonstrate method execution but do not independently establish incident conclusions.

These limits are intentionally documented rather than hidden.

## Skills Demonstrated

- forensic acquisition planning
- live memory acquisition
- process-specific memory capture
- physical-disk imaging
- E01 image verification
- remote artifact triage with KAPE
- filesystem identification
- metadata extraction
- deleted-file carving
- cryptographic hashing
- evidence-integrity reasoning
- distinguishing observation from interpretation
- documenting limitations and next justified actions

## Next Steps

The next Digital Forensics project will focus on **Windows Endpoint Artifact Reconstruction**, correlating LNK files, Prefetch, Jump Lists, browser artifacts, Recycle Bin metadata, and authentication evidence into endpoint activity timelines.

That project will be published only after the supporting Windows evidence is complete enough to support a coherent investigation rather than a collection of isolated lab answers.
