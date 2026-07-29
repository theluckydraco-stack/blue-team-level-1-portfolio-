# DDoS and Operational Resilience in Financial Services

## The problem

A financial organisation does not need to lose data to suffer a serious cyber incident.

If customers cannot reach online banking, payment APIs, trading platforms or authentication services, the organisation may lose revenue, breach service commitments and damage trust.

A **distributed denial-of-service (DDoS) attack** uses traffic from many systems or services to overwhelm a target or exhaust a limited resource.

```text
Large or carefully shaped malicious traffic
        ↓
Network, application or provider capacity exhausted
        ↓
Customers and partners cannot complete legitimate transactions
        ↓
Operational, financial and reputational impact
```

## Why this is highly relevant to finance

FS-ISAC and Akamai reported that financial services were the most targeted industry for volumetric DDoS attacks during 2024. Their reporting also described increasing precision and sophistication and noted a multi-bank attack associated with outages lasting several days.

ENISA's 2025 EU-wide threat landscape found DDoS to be the dominant recorded incident type. Much of that activity was hacktivist and produced limited disruption, which creates an important analytical lesson:

> A large number of attacks does not automatically mean a large operational impact.

The SOC must measure both **attack volume** and **business-service degradation**.

## Main DDoS forms

### Volumetric attack

The attacker floods the organisation or its provider with very large traffic volumes.

**Analogy:** too many vehicles are forced onto the road until legitimate traffic cannot move.

### Protocol or state-exhaustion attack

The attacker consumes connection tables, firewalls, load balancers or other network resources.

**Analogy:** the road is not full, but every toll-booth record is occupied by fake travellers.

### Application-layer attack

The attacker sends requests that resemble real customer activity but are expensive for the application to process, such as repeated login, search or transaction requests.

**Analogy:** a small group repeatedly asks a bank clerk to perform the slowest possible procedure until genuine customers cannot be served.

## Possible motivations

- ideological hacktivism;
- extortion;
- retaliation or geopolitical signalling;
- disruption of a competitor;
- diversion while another intrusion or fraud occurs;
- criminal DDoS-for-hire activity.

The technique alone does not prove the motivation or actor.

## Services a financial SOC should prioritise

- public websites and mobile APIs;
- online banking and customer authentication;
- payment and card-processing gateways;
- trading and market-data services;
- DNS and authoritative name services;
- customer-support portals;
- identity providers and MFA services;
- third-party APIs required to complete transactions;
- cloud and CDN dependencies.

## Evidence to collect

### Network and edge evidence

- traffic volume, packets and requests per second;
- source distribution and autonomous-system information;
- protocol, port and request method;
- CDN, DDoS-scrubbing, WAF and load-balancer logs;
- firewall and connection-table utilisation;
- DNS query volume and response health;
- upstream-provider alerts and mitigation actions.

### Application evidence

- response time and error rate;
- login, search, checkout or transaction endpoint usage;
- database, cache and worker-thread utilisation;
- queue depth and rate-limit events;
- application dependencies that failed first.

### Business evidence

- unsuccessful customer sessions;
- failed or delayed payments;
- call-centre volume;
- affected countries, customers and partners;
- regulatory or contractual service thresholds;
- revenue or transaction impact.

## Detection approach

A useful alert should combine attack telemetry with service health.

```text
Traffic anomaly
        +
Resource saturation
        +
Customer-facing error or latency increase
        =
High-confidence DDoS or availability incident
```

A traffic spike without service degradation may be a successful marketing event. Service degradation without unusual traffic may be an internal outage. Correlation prevents the SOC from treating every spike as an attack.

## Practical detection ideas

1. Compare current requests per second with the normal pattern for the same day and time.
2. Alert when one endpoint receives a large increase in requests while successful customer transactions fall.
3. Detect connection-table or load-balancer saturation before complete outage.
4. Identify low-volume application attacks through abnormal request cost, session creation or repeated expensive operations.
5. Correlate DDoS alerts with authentication failures, fraud events or intrusion alerts to identify diversionary activity.
6. Track attacks against suppliers whose outage would stop a critical financial service.

## Response priorities

- engage the CDN, internet provider or scrubbing service early;
- apply rate limits and challenge mechanisms carefully to avoid blocking real customers;
- move traffic through pre-planned alternate routes or providers;
- protect the most critical transaction and authentication services first;
- preserve network and application evidence;
- monitor for simultaneous fraud, intrusion or extortion activity;
- give customers and partners accurate service information;
- record business impact and recovery time.

## Resilience controls

- more than one resilient DNS, connectivity or mitigation path where justified;
- tested DDoS provider and escalation contacts;
- capacity and failover testing;
- application-level rate limiting and caching;
- separation of public browsing from critical transaction services;
- dependency maps showing which suppliers support each financial service;
- exercises involving SOC, network, application, fraud, communications and business-continuity teams.

## DORA relevance

The EU Digital Operational Resilience Act has applied since 17 January 2025. DORA treats ICT risk, incident management, resilience testing and third-party dependencies as financial-sector governance concerns.

A DDoS response should therefore answer more than “Was traffic blocked?” It should also answer:

- Which important business service was affected?
- Did failover work?
- Which third party was required?
- Was the incident classified and reported correctly?
- What control or architecture change is required?

## Modern parallels and updates

- DDoS should not be dismissed as a low-skill nuisance; financial-sector reporting shows it can become a strategic operational threat.
- Modern attacks may combine volumetric, protocol and application-layer methods.
- The relevant unit of defence is the **business service**, not only the IP address or server.
- Behaviour can be mapped to MITRE ATT&CK techniques such as `T1498` Network Denial of Service and `T1499` Endpoint Denial of Service, but ATT&CK mapping does not replace capacity and resilience engineering.
- Europol's continuing Operation PowerOFF shows that DDoS-for-hire infrastructure lowers the skill barrier for attackers.

## Sources

- FS-ISAC and Akamai — From Nuisance to Strategic Threat: DDoS Attacks Against the Financial Sector: https://www.fsisac.com/ddos-akamai-2025
- ENISA — Threat Landscape 2025: https://www.enisa.europa.eu/publications/enisa-threat-landscape-2025
- Europol — Operation PowerOFF: https://www.europol.europa.eu/how-we-work/operations/operation-poweroff
- EUR-Lex — Digital Operational Resilience Act: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32022R2554
