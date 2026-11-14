SELECT
    VEHICLE_YEAR,

    COUNT(*) AS Total_Policies,

    SUM(CASE
        WHEN OUTCOME = 1 THEN 1
        ELSE 0
    END) AS Claim_Filed_Count,

    SUM(CASE
        WHEN OUTCOME = 0 THEN 1
        ELSE 0
    END) AS No_Claim_Count,

    CAST(
        100.0 * SUM(CASE
            WHEN OUTCOME = 1 THEN 1
            ELSE 0
        END) / NULLIF(COUNT(*), 0)
        AS DECIMAL(5,2)
    ) AS Claim_Rate_Percentage

FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned

GROUP BY VEHICLE_YEAR;