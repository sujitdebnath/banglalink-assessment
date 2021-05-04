-- Create Desire Table
CREATE TABLE ipdr (
  id 		INT 		NOT NULL,
  starttime	DATETIME2	NOT NULL,
  endtime 	DATETIME2	NOT NULL,
  msisdn 	INT 		NOT NULL,
  ulvolume 	INT 		NOT NULL,
  dlvolume 	INT 		NOT NULL,
  domain 	VARCHAR(8) 	NOT NULL,
  PRIMARY KEY (id)
);


-- Insert Data into the Table
INSERT INTO ipdr (id, starttime, endtime, msisdn, ulvolume, dlvolume, domain) VALUES
	(1, '2021-04-02 12:23:10', '2021-04-02 12:24:48', 1, 10819, 9960, 'app1'),
    (2, '2021-04-02 12:28:56', '2021-04-02 12:33:12', 1, 16067, 10663, 'app1'),
    (3, '2021-04-02 16:24:21', '2021-04-02 16:38:28', 2, 1173, 4265, 'app1'),
    (4, '2021-04-02 15:08:57', '2021-04-02 15:20:56', 2, 1200, 192, 'app2'),
    (5, '2021-04-02 15:08:57', '2021-04-02 15:20:41', 2, 175130, 101657, 'app2'),
    (6, '2021-04-02 15:09:22', '2021-04-02 15:21:02', 2, 1440, 0, 'app2'),
    (7, '2021-04-02 15:09:22', '2021-04-02 15:20:35', 2, 3672, 1152, 'app2'),
    (8, '2021-04-02 15:09:22', '2021-04-02 15:21:08', 2, 1440, 0, 'app2'),
    (9, '2021-04-02 15:54:46', '2021-04-02 16:11:49', 3, 10932, 5504, 'app3'),
    (10, '2021-04-02 15:54:46', '2021-04-02 15:55:34', 3, 500, 580, 'app3'),
    (11, '2021-04-02 15:54:46', '2021-04-02 15:54:47', 3, 592, 656, 'app3'),
    (12, '2021-04-02 15:54:46', '2021-04-02 16:11:48', 3, 382607, 350215, 'app3'),
    (13, '2021-04-02 15:54:46', '2021-04-02 16:11:44', 3, 7728, 5392, 'app3'),
    (14, '2021-04-02 15:54:46', '2021-04-02 16:11:30', 3, 1702305, 1439409, 'app3'),
    (15, '2021-04-02 12:13:11', '2021-04-02 12:23:27', 3, 271, 6030, 'app4'),
    (16, '2021-04-02 16:15:17', '2021-04-02 16:25:24', 3, 3524, 663, 'app4'),
    (17, '2021-04-02 17:38:02', '2021-04-02 17:50:15', 3, 3358597, 3733223, 'app4'),
    (18, '2021-04-02 17:44:16', '2021-04-02 17:57:03', 3, 4672568, 4547960, 'app4'),
    (19, '2021-04-02 12:14:42', '2021-04-02 12:24:56', 4, 1456, 968, 'app3'),
    (20, '2021-04-02 12:14:43', '2021-04-02 12:14:43', 4, 524, 488, 'app3'),
    (21, '2021-04-02 12:14:43', '2021-04-02 12:14:43', 4, 940, 760, 'app3'),
    (22, '2021-04-02 20:53:24', '2021-04-02 21:04:25', 4, 145880, 64046, 'app3'),
    (23, '2021-04-02 20:53:25', '2021-04-02 20:53:34', 4, 1136, 680, 'app3'),
    (24, '2021-04-02 20:53:25', '2021-04-02 20:53:39', 4, 1660, 1132, 'app3'),
    (25, '2021-04-02 12:14:42', '2021-04-02 12:24:45', 4, 2328, 2441, 'app3'),
    (26, '2021-04-02 12:14:42', '2021-04-02 12:24:55', 4, 668, 408, 'app3'),
    (27, '2021-04-02 12:14:42', '2021-04-02 12:24:56', 4, 668, 408, 'app3'),
    (28, '2021-04-02 20:53:24', '2021-04-02 21:04:13', 4, 496200, 340357, 'app3'),
    (29, '2021-04-02 20:53:24', '2021-04-02 21:04:16', 4, 4312, 896, 'app3'),
    (30, '2021-04-02 20:53:24', '2021-04-02 21:04:16', 4, 11792, 2481, 'app3'),
    (31, '2021-04-02 22:27:36', '2021-04-02 22:34:55', 4, 6569, 577, 'app4'),
    (32, '2021-04-02 22:30:52', '2021-04-02 22:34:55', 4, 27334, 2478, 'app4'),
    (33, '2021-04-02 22:32:33', '2021-04-02 22:34:55', 4, 4162, 343, 'app4'),
    (34, '2021-04-02 22:33:29', '2021-04-02 22:34:55', 4, 168536, 27621, 'app4'),
    (35, '2021-04-02 22:34:15', '2021-04-02 22:34:55', 4, 7164, 1348, 'app4'),
    (36, '2021-04-02 22:34:43', '2021-04-02 22:34:55', 4, 4311, 1289, 'app4');


-- Task 04: Exclude Idle Time
SELECT
	msisdn, domain, starttime, endtime,
    CAST(endtime as datetime) - CAST('00:10' AS datetime) AS endtime_mod,
    CASE
        WHEN (CAST(endtime as datetime) - CAST('00:10' AS datetime)) < starttime THEN endtime
        ELSE CAST(endtime as datetime) - CAST('00:10' AS datetime)
    END AS endtime_exc_idl
FROM ipdr;


-- Task 05: Calculate Total Volume
SELECT
	msisdn, domain,
    SUM(ulvolume/1024.0) AS total_ul_kb,
    SUM(dlvolume/1024.0) AS total_dl_kb,
    SUM(ulvolume/1024.0) + SUM(dlvolume/1024.0) AS total_vol_kb
FROM ipdr
GROUP BY msisdn, domain
ORDER BY msisdn, domain;


-- Task 06: Calculate Total Time
SELECT
	msisdn, domain,
    MIN(starttime) AS min_st,
    MAX(endtime_exc_idl) AS max_et,
    DATEDIFF(SECOND, MIN(starttime), MAX(endtime_exc_idl)) AS total_time_sec,
    COUNT(id) AS fdr_count
FROM
	(SELECT
        id, msisdn, domain, starttime, endtime,
        CAST(endtime as datetime) - CAST('00:10' AS datetime) AS endtime_mod,
        CASE
            WHEN (CAST(endtime as datetime) - CAST('00:10' AS datetime)) < starttime THEN endtime
            ELSE CAST(endtime as datetime) - CAST('00:10' AS datetime)
        END AS endtime_exc_idl
    FROM ipdr) X
GROUP BY msisdn, domain
ORDER BY msisdn, domain;


-- Task 07: Calculate Bit Rate (kbps)
SELECT
	A.msisdn, A.domain, fdr_count, total_vol_kb, total_time_sec,
    (total_vol_kb / total_time_sec) AS bit_rate_kbps
FROM
	(SELECT
        msisdn, domain,
        SUM(ulvolume/1024.0) AS total_ul_kb,
        SUM(dlvolume/1024.0) AS total_dl_kb,
        SUM(ulvolume/1024.0) + SUM(dlvolume/1024.0) AS total_vol_kb
    FROM ipdr
    GROUP BY msisdn, domain) A LEFT OUTER JOIN
    (SELECT
        msisdn, domain,
        MIN(starttime) AS min_st,
        MAX(endtime_exc_idl) AS max_et,
        DATEDIFF(SECOND, MIN(starttime), MAX(endtime_exc_idl)) AS total_time_sec,
        COUNT(id) AS fdr_count
    FROM
        (SELECT
            id, msisdn, domain, starttime, endtime,
            CAST(endtime as datetime) - CAST('00:10' AS datetime) AS endtime_mod,
            CASE
                WHEN (CAST(endtime as datetime) - CAST('00:10' AS datetime)) < starttime THEN endtime
                ELSE CAST(endtime as datetime) - CAST('00:10' AS datetime)
            END AS endtime_exc_idl
        FROM ipdr) X
    GROUP BY msisdn, domain) B ON A.msisdn = B.msisdn and A.domain = B.domain
ORDER BY msisdn, domain;


-- Task 08: Identification of Audio or Video Call
SELECT
	A.msisdn, A.domain, fdr_count, total_vol_kb, total_time_sec,
    (total_vol_kb / total_time_sec) AS bit_rate_kbps,
    
    CASE
    	WHEN (total_vol_kb / total_time_sec) <= 1 THEN 'Yes' ELSE 'NO'
	END AS is_audio,
    
    CASE
    	WHEN (total_vol_kb / total_time_sec) > 1 THEN 'Yes' ELSE 'NO'
	END AS is_video
FROM
	(SELECT
        msisdn, domain,
        SUM(ulvolume/1024.0) AS total_ul_kb,
        SUM(dlvolume/1024.0) AS total_dl_kb,
        SUM(ulvolume/1024.0) + SUM(dlvolume/1024.0) AS total_vol_kb
    FROM ipdr
    GROUP BY msisdn, domain) A LEFT OUTER JOIN
    (SELECT
        msisdn, domain,
        MIN(starttime) AS min_st,
        MAX(endtime_exc_idl) AS max_et,
        DATEDIFF(SECOND, MIN(starttime), MAX(endtime_exc_idl)) AS total_time_sec,
        COUNT(id) AS fdr_count
    FROM
        (SELECT
            id, msisdn, domain, starttime, endtime,
            CAST(endtime as datetime) - CAST('00:10' AS datetime) AS endtime_mod,
            CASE
                WHEN (CAST(endtime as datetime) - CAST('00:10' AS datetime)) < starttime THEN endtime
                ELSE CAST(endtime as datetime) - CAST('00:10' AS datetime)
            END AS endtime_exc_idl
        FROM ipdr) X
    GROUP BY msisdn, domain) B ON A.msisdn = B.msisdn and A.domain = B.domain
WHERE (total_vol_kb / total_time_sec) >= 0.5
ORDER BY msisdn, domain;


-- All Task Combine
SELECT
	A.msisdn, A.domain, total_time_sec, fdr_count, total_vol_kb,
    (total_vol_kb / total_time_sec) AS bit_rate_kbps,
    
    CASE
    	WHEN (total_vol_kb / total_time_sec) <= 1 THEN 'Yes' ELSE 'NO'
	END AS is_audio,
    
    CASE
    	WHEN (total_vol_kb / total_time_sec) > 1 THEN 'Yes' ELSE 'NO'
	END AS is_video
FROM
	(SELECT
        msisdn, domain,
        SUM(ulvolume/1024.0) AS total_ul_kb,
        SUM(dlvolume/1024.0) AS total_dl_kb,
        SUM(ulvolume/1024.0) + SUM(dlvolume/1024.0) AS total_vol_kb
    FROM ipdr
    GROUP BY msisdn, domain) A LEFT OUTER JOIN
    (SELECT
        msisdn, domain,
        MIN(starttime) AS min_st,
        MAX(endtime_exc_idl) AS max_et,
        DATEDIFF(SECOND, MIN(starttime), MAX(endtime_exc_idl)) AS total_time_sec,
        COUNT(id) AS fdr_count
    FROM
        (SELECT
            id, msisdn, domain, starttime, endtime,
            CAST(endtime as datetime) - CAST('00:10' AS datetime) AS endtime_mod,
            CASE
                WHEN (CAST(endtime as datetime) - CAST('00:10' AS datetime)) < starttime THEN endtime
                ELSE CAST(endtime as datetime) - CAST('00:10' AS datetime)
            END AS endtime_exc_idl
        FROM ipdr) X
    GROUP BY msisdn, domain) B ON A.msisdn = B.msisdn and A.domain = B.domain
WHERE (total_vol_kb / total_time_sec) >= 0.5
ORDER BY msisdn, domain;