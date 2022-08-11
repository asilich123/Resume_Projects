--Update Below Date to Today for Accurate Data
DECLARE @today AS DATE
SET @today = '2022-08-10'

SELECT
	   b.[ANumber] + ' ' + b.[AStreet] + ', ' + b.[ACity] + ', ' + b.[AState] + ' ' + b.[AZip] as FullAddress
	  ,[pcode]
	  ,FORMAT([SalesPriceAct], 'c') as SalesPriceAct
      ,FORMAT([RevenueActual], 'c') as RevenueActual
      ,FORMAT([PPurchaseCost], 'c') as PurchaseCost
      ,FORMAT([RehabAct], 'c') as RehabActual
      ,FORMAT([ExpensesActual], 'c') as ExpensesActual
      ,FORMAT([NetIncomeActual], 'c') as NetIncomeActual
      ,FORMAT([SoldDateBud], 'MM-dd-yy') as SoldDateBudget
      ,FORMAT([SoldDateAct], 'MM-dd-yy') as SoldDateActual
      ,[DaysHeldBud]
      ,[DaysHeldAct]
      ,FORMAT([SalesPriceBud], 'c') as SalesPriceBudget
      ,FORMAT([RevenueBudget], 'c') as RevenueBudget
      ,FORMAT([PropertyCostBud], 'c') as PropertyCostBudget
      ,FORMAT([RehabBud], 'c') as RehabBudget
      ,[RehabDaysHeld]
      ,[SqFtFinished]
  FROM [PERLESMP4].[dbo].[vwPropertyBudget] a 
  JOIN [PERLESMP4].[dbo].[tblAcquisition] b
  ON a.[PID] = b.[PID]
  WHERE SoldDateAct BETWEEN '2022-01-01' AND @today

