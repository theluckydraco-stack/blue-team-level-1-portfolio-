# Preliminary Strategic Findings

## Assessment Scope

This preliminary assessment explains why the project prioritises current digital-finance attack models rather than following the order of the BTL1 actor activity.

## Key Judgements

### 1. Direct financial theft and virtual-asset compromise deserve the highest priority

DPRK-linked financial-theft activity is directly relevant because the intended outcome is the acquisition of money or virtual assets. The February 2025 Bybit theft demonstrates that cryptocurrency infrastructure is part of the modern financial system and can create losses measured in billions of dollars.

### 2. Identity has become a primary financial attack surface

UNC3944 demonstrates that attackers do not always need to exploit software. Help-desk social engineering, MFA reset abuse, stolen personal information and SaaS permission changes can provide access to many connected services. Financial institutions with large help desks, outsourced support teams and complex cloud estates face particular exposure.

### 3. Third-party enterprise software can create systemic downstream exposure

MOVEit exploitation demonstrates that a single managed file-transfer product can expose data belonging to many organisations. The strategic risk is not limited to the vulnerable vendor: it extends to every customer, partner, employee and regulated dataset passing through the service.

### 4. Strategic espionage requires analysis beyond the immediate technical incident

APT41's reported targeting of telecom records and hotel reservation systems shows that the value of cyber access may be linked to surveillance, travel, diplomatic activity or sponsor priorities. The same technical event can have very different implications depending on the victim, timing and expected use of the data.

### 5. Actor labels must not replace campaign-specific analysis

APT41, APT38, BlueNoroff, TraderTraitor, UNC3944, Scattered Spider, FIN11 and CL0P are analytical or source-specific labels. The project will evaluate each campaign using the source's own definition and will not assume complete overlap.

## Implications for a Financial SOC

A modern financial SOC needs visibility beyond endpoint malware alerts. Priority telemetry includes:

- Cloud identity and MFA administration
- Help-desk account recovery and identity verification
- SaaS application assignments, OAuth grants and integration tokens
- Managed file-transfer and third-party application logs
- Virtualisation and hypervisor administration
- Public-facing application and edge-device activity
- Cryptocurrency wallet and transaction intelligence where relevant
- Data movement to cloud-storage and file-sharing services
- Vendor access and software-integrity controls

## Implications for Leadership

- Financial risk now includes banks, fintech, cryptocurrency, SaaS providers and outsourced technology partners.
- A third-party compromise can create regulatory, operational and reputational consequences even when the institution's own perimeter was not directly breached.
- State-linked activity may seek strategic information rather than immediate payment theft.
- Identity assurance, third-party governance and recovery architecture are business-resilience issues, not only technical controls.

## Confidence and Limitations

These are preliminary judgements based on authoritative public reporting. The relative actor priority may change as the profiles are completed and stronger Europe-specific evidence is collected.