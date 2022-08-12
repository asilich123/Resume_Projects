--Update Below Date to Today for Accurate Data
DECLARE @today AS DATE
SET @today = '2022-08-10'

SELECT
	   b.[ANumber] + ' ' + b.[AStreet] + ', ' + b.[ACity] + ', ' + b.[AState] + ' ' + b.[AZip] as FullAddress
	  ,ANumber + ' ' + AStreet as StreetAddress
	  ,ACity
	  ,AState
	  ,AZip
	  ,'USA' as Country
	  ,FORMAT(a.[SalesPriceAct], 'c') as SalesPriceAct
      ,FORMAT([RevenueActual], 'c') as RevenueActual
      ,FORMAT([PPurchaseCost], 'c') as PurchaseCost
      ,FORMAT(a.[RehabAct], 'c') as RehabActual
      ,FORMAT([ExpensesActual], 'c') as ExpensesActual
      ,FORMAT([NetIncomeActual], 'c') as NetIncomeActual
      ,FORMAT(a.[SoldDateBud], 'MM-dd-yy') as SoldDateBudget
      ,FORMAT(a.[SoldDateAct], 'MM-dd-yy') as SoldDateActual
      ,a.[DaysHeldBud]
      ,a.[DaysHeldAct]
      ,FORMAT(a.[SalesPriceBud], 'c') as SalesPriceBudget
      ,FORMAT([RevenueBudget], 'c') as RevenueBudget
      ,FORMAT(a.[RehabBud], 'c') as RehabBudget
      ,[RehabDaysHeld]
      ,[SqFtFinished]
	  ,FORMAT(a.PPurchaseCost + a.ExpensesActual + c.StagingAct, 'c') AS TotalExpenses
	  ,FORMAT(NetIncomeActual / (a.PPurchaseCost + a.ExpensesActual + c.StagingAct), 'p') AS ROI
	  ,FORMAT(NetIncomeActual * 365 / (a.PPurchaseCost + a.ExpensesActual + c.StagingAct) / a.DaysHeldAct, 'p') as AROI
  FROM [PERLESMP4].[dbo].[vwPropertyBudget] a 
  JOIN [PERLESMP4].[dbo].[tblAcquisition] b
  ON a.[PID] = b.[PID]
  JOIN [PERLESMP4].[dbo].[tblPropertyBudget] c
  ON a.[PID] = c.[PID]
  WHERE a.SoldDateAct BETWEEN '2020-01-01' AND @today
  AND ACounty IN ('Los Angeles', 'Orange')