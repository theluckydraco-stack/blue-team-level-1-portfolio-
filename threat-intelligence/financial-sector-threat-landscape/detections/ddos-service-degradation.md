# Detection Specification: DDoS Traffic Correlated with Service Degradation

## Detection objective

Identify malicious or abnormal traffic that is materially degrading a financial service, rather than alerting on traffic volume alone.

## Threat basis

Financial institutions face volumetric, protocol and application-layer DDoS attacks. Current sector reporting treats DDoS as an operational-resilience and customer-trust problem.

## Financial services at risk

- online and mobile banking;
- payment and card-processing APIs;
- trading and market-data services;
- customer authentication and MFA;
- DNS and public websites;
- customer-support portals;
- third-party services required to complete transactions.

## Required telemetry

- CDN and DDoS-scrubbing alerts;
- requests, packets and bandwidth per second;
- source distribution, protocol and endpoint;
- WAF, load-balancer and firewall utilisation;
- DNS health and query volume;
- application latency, error and saturation metrics;
- successful and failed customer transactions;
- upstream-provider and cloud status;
- fraud, intrusion and extortion alerts during the same period.

## Correlation logic

Create a high-priority alert when abnormal traffic coincides with measurable service degradation.

```text
Traffic or request anomaly
        +
Resource saturation
        +
Customer-facing latency, error or transaction failure
        =
Material availability incident
```

Increase severity when:

- several banks, regions or service providers are affected;
- authentication or payment endpoints fail;
- mitigation capacity is nearing exhaustion;
- the attack changes methods after mitigation begins;
- extortion, hacktivist claims or intrusion alerts appear at the same time;
- a critical third-party provider is the actual point of failure.

## Expected legitimate activity

- marketing or product launches;
- salary, benefit or tax-payment periods;
- market volatility;
- scheduled batch or partner activity;
- internal application failure;
- provider outages unrelated to attack traffic.

The detection should compare traffic with the business calendar and service health.

## Investigation steps

1. Confirm which business services and customer groups are affected.
2. Determine whether the traffic is volumetric, protocol-based or application-layer.
3. Identify the first saturated dependency.
4. Review attack sources, methods and endpoint distribution.
5. Confirm whether mitigation services activated correctly.
6. Search for simultaneous account takeover, fraud, intrusion or extortion activity.
7. Record transaction, revenue, customer and regulatory impact.

## Containment and resilience actions

- engage upstream, CDN or scrubbing providers;
- apply tested rate limits, filtering or challenges;
- protect authentication and transaction services before non-critical content;
- use alternate routes, regions or providers where designed;
- preserve relevant network and application evidence;
- communicate service status accurately;
- initiate business-continuity and regulatory processes as required.

## ATT&CK mapping

- `T1498` — Network Denial of Service
- `T1499` — Endpoint Denial of Service

## Validation plan

Use an approved load-testing environment and provider-coordinated exercise. Generate controlled traffic below agreed safety limits, verify that service-health telemetry is visible and confirm that escalation and failover procedures work.

Never test DDoS controls against public or third-party services without written authorisation and provider coordination.

## Review conditions

Review when:

- traffic architecture, CDN or cloud provider changes;
- new critical APIs are launched;
- a real incident exposes an unmonitored dependency;
- service thresholds or regulatory reporting requirements change;
- threat reporting identifies a new attack method.
