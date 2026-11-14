--DUI and speeding violation
SELECT
    DUIS,
    SPEEDING_VIOLATIONS,
    PAST_ACCIDENTS,

    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN OUTCOME = 1 THEN 1
        ELSE 0
    END) AS positive_outcomes,

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
    DUIS,
    SPEEDING_VIOLATIONS,
    PAST_ACCIDENTS

ORDER BY
    outcome_rate DESC,
    total_customers DESC;