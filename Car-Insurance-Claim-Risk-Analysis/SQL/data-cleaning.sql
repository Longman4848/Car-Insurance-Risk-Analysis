SELECT COUNT(*) AS total_rows
FROM [Car-Insurance].dbo.Car_Insurance_Claim;

-- Inspect the column definitions
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    IS_NULLABLE
FROM [Car-Insurance].INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'dbo'
  AND TABLE_NAME = 'car_insurance_claim'
ORDER BY ORDINAL_POSITION;

SELECT *
FROM [Car-Insurance].dbo.Car_Insurance_Claim;
