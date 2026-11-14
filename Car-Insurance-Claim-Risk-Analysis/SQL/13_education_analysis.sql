SELECT 
    EDUCATION,
    COUNT(*) AS Total_Policies,
    SUM(CASE WHEN OUTCOME = 1 THEN 1 END) AS Total_Claims,
    ROUND(
        SUM(CASE WHEN OUTCOME = 1 THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS Claim_Rate_Percentage
FROM [car-Insurance].clean.Car_Insurance_Claim_Cleaned
GROUP BY EDUCATION
ORDER BY Claim_Rate_Percentage DESC;