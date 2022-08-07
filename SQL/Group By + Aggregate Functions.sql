SELECT 
	COUNT(a.[PID]) as NumOfOffers, 
	b.[PCode], 
	AVG(a.[OfferPrice]) / AVG(a.[ListedPrice]) as AvgOfferPrctofListP

  FROM [PERLESMP4].[dbo].[tblPropertyOffers] a
  INNER JOIN [PERLESMP4].[dbo].[tblProperty] b
  ON a.PID = b.PID
  GROUP BY a.[PID], b.[PCode]
  HAVING MIN(a.[OfferReceived]) >= '2022-04-01'