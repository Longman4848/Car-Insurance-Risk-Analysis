--Past accident
SELECT
    PAST_ACCIDENTS,
    COUNT(*) AS total_customers,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS customer_percentage
FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned
GROUP BY PAST_ACCIDENTS
ORDER BY PAST_ACCIDENTS;

SELECT
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
GROUP BY PAST_ACCIDENTS
ORDER BY PAST_ACCIDENTS;