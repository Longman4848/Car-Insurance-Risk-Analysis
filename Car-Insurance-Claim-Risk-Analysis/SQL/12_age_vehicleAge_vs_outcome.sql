SELECT
    AGE,
    VEHICLE_YEAR,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN OUTCOME = 1 THEN 1
        ELSE 0
    END) AS positive_outcomes,

    SUM(CASE
        WHEN OUTCOME = 0 THEN 1
        ELSE 0
    END) AS negative_outcomes,

    ROUND(
        AVG(
            CASE
                WHEN OUTCOME = 1 THEN 100.0
                ELSE 0.0
            END
        ), 2
    ) AS outcome_rate

FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned

GROUP BY
    AGE,
    VEHICLE_YEAR

ORDER BY
    outcome_rate DESC;