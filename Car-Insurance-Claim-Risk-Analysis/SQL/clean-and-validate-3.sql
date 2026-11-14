--USE [car-Insurance];
--GO

--CREATE SCHEMA clean;
--GO

USE [car-Insurance];
GO

-- Recreate cleaned table from original source
DROP TABLE IF EXISTS clean.Car_Insurance_Claim_Cleaned;
GO

SELECT *
INTO clean.Car_Insurance_Claim_Cleaned
FROM dbo.Car_Insurance_Claim;
GO

-- Standardize whitespace in categorical text columns
UPDATE clean.Car_Insurance_Claim_Cleaned
SET
    AGE = NULLIF(LTRIM(RTRIM(AGE)), ''),
    GENDER = NULLIF(LTRIM(RTRIM(GENDER)), ''),
    RACE = NULLIF(LTRIM(RTRIM(RACE)), ''),
    DRIVING_EXPERIENCE = NULLIF(LTRIM(RTRIM(DRIVING_EXPERIENCE)), ''),
    EDUCATION = NULLIF(LTRIM(RTRIM(EDUCATION)), ''),
    VEHICLE_TYPE = NULLIF(LTRIM(RTRIM(VEHICLE_TYPE)), '');
GO