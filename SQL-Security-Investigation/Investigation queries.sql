--============================================
-- 1. Dataset Baseline
--============================================


-- How much data have I got?
SELECT COUNT(*)
FROM login_events;

-- How many failures are there?
SELECT COUNT(*)
FROM login_events
WHERE success = 0;

-- What timeline does this cover?
SELECT min(timestamp), MAX(timestamp)
FROM login_events;

-- How many employees are there?
SELECT count(*)
FROM employees;

--============================================
-- 2. Failed login analysis
--============================================


--Are there any unusually high amounts of failed logins?
SELECT l.username, count(l.success), e.*
FROM login_events AS l
LEFT JOIN employees AS e
ON l.username = e.username
WHERE success = 0
ORDER BY count(success) ASC;
-- This did not split the logins into separate users and did not provide me with enough information

--This code organises the logins into the individual users
SELECT e.first_name, e.last_name, e.employment_status, e.username, COUNT(l.success) AS failed_logins
FROM employees AS e
LEFT JOIN login_events AS l
ON e.username = l.username
AND (l.success=0)
GROUP BY e.first_name, e.last_name, e.employment_status, e.username
ORDER BY failed_logins DESC;

--============================================
-- 3. mmoore account Investigation
--============================================


-- Are all the attempts of mmoore being conducted by the user?
SELECT timestamp, ip_address, country, device, success, event_type
FROM login_events
WHERE username = 'mmoore'
ORDER BY timestamp ASC;
-- This has shown that there is other IP addresses that have attempted to login to the account, one being successful and gaining priveleged access

-- Which IP address is being used most frequently?
SELECT ip_address, country, COUNT(*) AS attempts
FROM login_events
WHERE username = 'mmoore'
GROUP BY ip_address
ORDER BY attempts DESC;
--An IP in RU has attempted 30 times to access the account

--I need to split the attempts into success and failures
SELECT ip_address, country, success, COUNT(*) AS attempts
FROM login_events
WHERE username = 'mmoore'
GROUP BY ip_address, country, success
ORDER BY attempts DESC;
-- From this I can see that the RU IP has failed 28 times and succeeded twice

--When does the RU IP attempt to access the account and when is it successful?
SELECT timestamp, username, success, event_type
FROM login_events
WHERE ip_address = '91.214.124.77'
ORDER BY timestamp ASC;
--All attempts are on 21-08-26. Starting at 01:12, authentication from the IP was successful at 02:10. A priveleged access event occurred at 02:19 with the same IP address and account.

--What happened after the priveleged access event?
SELECT *
FROM login_events
WHERE username = 'mmoore' AND timestamp between '2026-08-21 02:19:00' AND '2026-08-21 07:00:00'
ORDER BY timestamp ASC;
-- This shows that the priveleged access would be the last authentication event for this account

-- What access should this user have and where would they normally work from?
SELECT *
FROM employees
WHERE username = 'mmoore';
--The user's office is in London and therefore the RU access would be deemed suspicious given the user works in the UK. The user works in HR and therefore would have access to employee details and sensitive information. This would require further investigation as to what information has been accessed.

--What type of devices does the user normally use to access systems?
SELECT country, device, COUNT(*) AS attempts
FROM login_events
WHERE username = 'mmoore'
GROUP BY country, device;
--This has shown me that the user would regularly login with an iPhone. The IP in Russia however has used Linux and further evidences a need for ongoing investigation

--============================================
-- 4. Terminated account Investigation
--============================================


--When I run the employee data, it can be seen that an employee is showing as terminated. Are terminate employee accounts still authenticating?
SELECT l.*
FROM employees AS e
LEFT JOIN login_events AS l
ON e.username = l.username
WHERE employment_status = 'Terminated'
ORDER BY timestamp ASC;
-- This result has shown that username rshah, although listed as terminated, has successfully logged in and accessed files on 22-08-26. They have used a Windows laptop in the UK. It cannot be seen what the user has accessed and would warrant further investigation.

--I need to clarify if I know when the users employment was terminated
SELECT *
FROM employees
WHERE username = 'rshah';
--This table does not show this information and would require being checked to determine if the user accessed the system after their employment was terminated or not