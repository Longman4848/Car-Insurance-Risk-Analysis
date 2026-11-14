SELECT
    CASE
        WHEN AGE IN ('16-25') THEN 'Young Drivers'
        WHEN AGE IN ('26-39') THEN 'Early Career Drivers'
        WHEN AGE IN ('40-64') THEN 'Experienced Age Group'
        WHEN AGE = '65+' THEN 'Senior Drivers'
        ELSE 'Unknown'
    END AS age_segment,

    DRIVING_EXPERIENCE,

    COUNT(*) AS total_customers,

    SUM(CASE WHEN OUTCOME = 1 THEN 1 ELSE 0 END)
        AS positive_outcomes,

    ROUND(
        AVG(CASE WHEN OUTCOME = 1 THEN 100.0 ELSE 0.0 END),
        2
    ) AS outcome_rate

FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned

GROUP BY
    CASE
        WHEN AGE IN ('16-25') THEN 'Young Drivers'
        WHEN AGE IN ('26-39') THEN 'Early Career Drivers'
        WHEN AGE IN ('40-64') THEN 'Experienced Age Group'
        WHEN AGE = '65+' THEN 'Senior Drivers'
        ELSE 'Unknown'
    END,
    DRIVING_EXPERIENCE

ORDER BY outcome_rate DESC;


WITH AgeAnalysis AS
(
    SELECT
        AGE,
        COUNT(*) AS total_customers,

        AVG(
            CASE WHEN OUTCOME = 1
            THEN 100.0 ELSE 0.0 END
        ) AS outcome_rate

    FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned
    GROUP BY AGE
)

SELECT
    AGE,
    total_customers,
    ROUND(outcome_rate, 2) AS outcome_rate,

    RANK() OVER (
        ORDER BY outcome_rate DESC
    ) AS category_rank

FROM AgeAnalysis;