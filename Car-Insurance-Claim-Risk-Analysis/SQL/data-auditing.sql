--To get the number of NULLs in each column
SELECT
    COUNT(*) AS total_records,

    SUM(CASE WHEN ID IS NULL THEN 1 ELSE 0 END) AS null_id,
    SUM(CASE WHEN AGE IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN GENDER IS NULL THEN 1 ELSE 0 END) AS null_gender,
    SUM(CASE WHEN RACE IS NULL THEN 1 ELSE 0 END) AS null_race,
    SUM(CASE WHEN DRIVING_EXPERIENCE IS NULL THEN 1 ELSE 0 END) AS null_experience,
    SUM(CASE WHEN EDUCATION IS NULL THEN 1 ELSE 0 END) AS null_education,
    SUM(CASE WHEN INCOME IS NULL THEN 1 ELSE 0 END) AS null_income,
    SUM(CASE WHEN CREDIT_SCORE IS NULL THEN 1 ELSE 0 END) AS null_credit_score,
    SUM(CASE WHEN VEHICLE_OWNERSHIP IS NULL THEN 1 ELSE 0 END) AS null_ownership,
    SUM(CASE WHEN VEHICLE_YEAR IS NULL THEN 1 ELSE 0 END) AS null_vehicle_year,
    SUM(CASE WHEN MARRIED IS NULL THEN 1 ELSE 0 END) AS null_married,
    SUM(CASE WHEN CHILDREN IS NULL THEN 1 ELSE 0 END) AS null_children,
    SUM(CASE WHEN POSTAL_CODE IS NULL THEN 1 ELSE 0 END) AS null_postal_code,
    SUM(CASE WHEN ANNUAL_MILEAGE IS NULL THEN 1 ELSE 0 END) AS null_mileage,
    SUM(CASE WHEN VEHICLE_TYPE IS NULL THEN 1 ELSE 0 END) AS null_vehicle_type,
    SUM(CASE WHEN SPEEDING_VIOLATIONS IS NULL THEN 1 ELSE 0 END) AS null_speeding,
    SUM(CASE WHEN DUIS IS NULL THEN 1 ELSE 0 END) AS null_duis,
    SUM(CASE WHEN PAST_ACCIDENTS IS NULL THEN 1 ELSE 0 END) AS null_accidents,
    SUM(CASE WHEN OUTCOME IS NULL THEN 1 ELSE 0 END) AS null_outcome

FROM [car-Insurance].dbo.Car_Insurance_Claim;


-- To calculate the percentage of NULL in credit_score
SELECT
    COUNT(*) AS total_records,

    ROUND(
        100.0 * SUM(
            CASE WHEN CREDIT_SCORE IS NULL THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS credit_score_null_percentage

FROM [car-Insurance].dbo.Car_Insurance_Claim;


-- to check for duplicate ID
SELECT
    ID,
    COUNT(*) AS occurrences
FROM [car-Insurance].dbo.Car_Insurance_Claim
GROUP BY ID
HAVING COUNT(*) > 1;


--to heck for valid age range
SELECT DISTINCT AGE
FROM [car-Insurance].dbo.Car_Insurance_Claim
ORDER BY AGE;

SELECT
    COUNT(*) AS total_records,
    COUNT(CREDIT_SCORE) AS available_scores,
    SUM(CASE WHEN CREDIT_SCORE IS NULL THEN 1 ELSE 0 END) AS missing_scores,
    MIN(CREDIT_SCORE) AS minimum_score,
    MAX(CREDIT_SCORE) AS maximum_score
FROM [car-Insurance].dbo.Car_Insurance_Claim;