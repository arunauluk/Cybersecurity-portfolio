# SQL Security Investigation

## Overview

Independent cybersecurity investigation using SQL to analyse
1,142 simulated authentication events across 60 employee accounts.

The objective was to identify anomalous authentication behaviour,
investigate potential security incidents and produce evidence-based
recommendations.

## Scenario

Northstar Solutions received reports of unusual authentication
activity between 17 and 23 August 2026.

No security incident had been confirmed.

I was tasked with analysing employee and authentication data to
determine whether any activity required escalation.

## Tools

- SQLite
- DB Browser for SQLite
- SQL

## SQL Skills Demonstrated

- SELECT
- WHERE
- COUNT()
- GROUP BY
- ORDER BY
- JOIN / LEFT JOIN
- Aggregate analysis
- Table correlation

## Investigation Methodology

I began by establishing a baseline of authentication activity across
the organisation.

Accounts displaying anomalous behaviour were investigated further
using:

- Failed authentication frequency
- Source IP addresses
- Geographic location
- Device information
- Authentication success/failure
- Event timelines
- Employee records

## Key Findings

### Finding 1 — Suspected Account Compromise

Analysis identified an employee account with an unusually high
number of failed authentication attempts.

Further investigation identified authentication activity originating
from an anomalous geographic location and device, followed by
successful authentication and a privileged-access event.

The combination of indicators was assessed as consistent with a
suspected account compromise requiring further investigation.

### Finding 2 — Potential Account Deprovisioning Issue

Authentication activity was identified for an employee account
recorded as terminated.

The available dataset did not contain a termination date, meaning
it could not be established whether the activity occurred after
employment ended.

The finding would require verification against HR and account
offboarding records.

## Evidence

The full SQL investigation is available in:

`Investigation-Queries.sql`

A detailed investigation report containing findings, risk analysis
and recommendations is available in:

`Northstar-Security-Investigation-Report.pdf`

## What I Learned

This project developed my ability to use SQL as an investigative
tool rather than simply retrieving data.

I used SQL to establish baselines, identify anomalies, test
hypotheses, correlate multiple datasets and build an evidence-based
assessment while recognising limitations within the available data.

## Disclaimer

All organisations, employees, IP addresses and authentication data
used in this project are fictional and were created solely for
cybersecurity training purposes.
