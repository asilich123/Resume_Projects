SELECT a.[OfferID]
      ,a.[PID]
	  ,b.[PCode]
	  ,b.[StatusCode]
      ,a.[OfferStatus]
      ,a.[EscrowStatus]
      ,a.[OfferReceived]
      ,a.[AccpectedDate]
      ,a.[BuyerName]
      ,a.[ListedPrice]
      ,a.[OfferPrice]
	  ,a.[OfferPrice] / a.[ListedPrice] as PercentofListP
      ,a.[COEDays]
  FROM [PERLESMP4].[dbo].[tblPropertyOffers] as a
  JOIN [PERLESMP4].[dbo].[tblProperty] as b
  ON a.PID = b.PID
  WHERE OfferReceived >= '2022-06-01'
  AND NOT PCode IN (
		SELECT 
		b.[PCode]
		FROM [PERLESMP4].[dbo].[tblPropertyOffers] as a
		JOIN [PERLESMP4].[dbo].[tblProperty] as b
		ON a.PID = b.PID
		WHERE OfferReceived >= '2022-06-01'
		AND EscrowStatus = 'ES_COMPLETE') 

UNION

SELECT DISTINCT
	 null as OfferID
	,null as PID
	,b.PCode
	,b.Statuscode
	,null as OfferStatus
	,null as EscrowStatus
	,null as OfferReceived
	,null as AcceptedDate
	,null as BuyerName
	,null as ListedPrice
	,null as OfferPrice
	,null as PercentoflistP
	,null as COEDays
FROM [PERLESMP4].[dbo].[tblProperty] b
FULL JOIN [PERLESMP4].[dbo].[tblPropertyOffers] as a
ON a.PID = b.PID
WHERE b.StatusCode = 'Listed'
AND NOT b.PCode IN (
	SELECT  
		b.[PCode] 
	 FROM [PERLESMP4].[dbo].[tblPropertyOffers] a
	 INNER JOIN [PERLESMP4].[dbo].[tblProperty] b
	 ON a.PID = b.PID
	 GROUP BY a.[PID], b.[PCode]
	 HAVING MIN(a.[OfferReceived]) >= '2022-06-01')
Order By 'PCode'