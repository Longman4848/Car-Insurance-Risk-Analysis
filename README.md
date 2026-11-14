# Car-Insurance-Risk-Analysis
End-to-end motor insurance risk analysis, shifting from raw counts to risk-normalized metrics using SQL and Power BI.
# 🚗 Motor Insurance Risk & Underwriting Analytics Dashboard

## 📊 Executive Summary
An end-to-end data analytics solution built for Executive Management, Underwriting, and Claims departments. This project shifts portfolio analysis from misleading **raw policy counts** to **risk-normalized metrics (`Claim Rate %`)**, uncovering high-hazard risk segments, vehicle era exposure, and driver cohort vulnerabilities.

---

## 📸 Dashboard Preview
<img width="955" height="407" alt="PowerBI-visual" src="https://github.com/user-attachments/assets/3c9e7a75-2054-4be9-9e17-d96526c8fa53" />



---

## 🛠️ Tech Stack & Tools
* **SQL:** Data aggregation, filtering, and risk-rate calculations (`CASE WHEN`, window functions).
* **Power BI:** Interactive data modeling, DAX measures,  and executive layout design.
* **Google Slides / PowerPoint:** Executive-ready stakeholder presentation.

---

## 📈 Key Analytical Findings
1. **Portfolio Baseline:** Overall portfolio claim rate stands at **31.33%**, establishing a core benchmark for loss frequency.
2. **Vehicle Era Disparity:** **90%** of total claims exposure originates from pre-2015 legacy vehicles, highlighting critical depreciation and maintenance risks.


---

## 💻 Sample SQL Analysis
Here is a sample query used to evaluate claim rate risk percentages across driver education brackets:

```sql
SELECT 
    EDUCATION,
    COUNT(*) AS Total_Policies,
    SUM(CASE WHEN OUTCOME = 1 THEN 1 END) AS Total_Claims,
    ROUND(
        SUM(CASE WHEN OUTCOME = 1 THEN 1 END) * 100.0 / COUNT(*), 
        2
    ) AS Claim_Rate_Percentage
FROM "clean Car_Insurance_Claim_Cleaned"
GROUP BY EDUCATION
ORDER BY Claim_Rate_Percentage DESC;
