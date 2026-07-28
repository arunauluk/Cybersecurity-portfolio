# Yummy Recipes For Me — Security Incident Investigation

## Overview

This project is a simulated cybersecurity incident investigation completed as part of the Google Cybersecurity Certificate. It documents the analysis of a brute force attack and subsequent malware distribution incident affecting a fictional e-commerce website, yummyrecipesforme.com.

The exercise involved identifying the network protocol used during the attack, documenting the incident based on log evidence and reported symptoms, and recommending a remediation to prevent similar attacks in future.

## Scenario Summary

A former employee gained unauthorised access to the website's admin panel via a brute force attack, exploiting the fact that the default administrative password had never been changed. Once inside, the attacker modified the site's source code to prompt visitors to download a malicious file disguised as a browser update. Customers who ran the file were redirected to a fake version of the website and had their machines compromised. The attacker also changed the admin password, locking the legitimate website owner out of their own account.

## What This Project Demonstrates

- **Protocol identification** — Reading and interpreting a tcpdump packet capture to identify HTTP traffic at the application layer, and tracing how it was used both to serve the legitimate site and to deliver the malicious payload.
- **Incident documentation** — Writing a factual, evidence-based incident report free of speculative or emotive language, structured to be usable by other analysts or for audit purposes.
- **Evidence-to-conclusion traceability** — Linking observed symptoms (customer reports, admin lockout) to log evidence (DNS/HTTP request sequence) to root cause (brute force attack via default credentials).
- **Remediation reasoning** — Selecting and justifying a specific security control (password reuse restriction, supported by frequent password rotation and 2FA) directly tied to the identified vulnerability, rather than a generic list of best practices.

## Why This Matters for GRC

Identifying what happened at the network level is only half the job. The other half is translating that technical evidence into documentation and controls that a business can act on — which is the core of governance, risk, and compliance work. This project reflects that translation: from raw packet data, to a clear incident narrative, to a risk-based recommendation an organisation could actually implement.

## Files in This Repository

- [Security Incident report (.docx)](./Security%20incident%20report%20template.docx) — Full three-section incident report: protocol identification, incident documentation, and remediation recommendation.
- [TCP Dump log (.docx)](./tcpdump%20traffic%20log.docx) — Evidence for protocol identification in Section 1 of the report.

## Tools & Concepts Used

- tcpdump / packet capture analysis
- TCP/IP model (application layer protocol identification)
- Incident documentation standards
- Brute force attack mitigation (password policy, 2FA)
