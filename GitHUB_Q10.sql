	Use Healthcare_DB
	
	Select
	LocationName,
	ProviderName,
	-SUM(Adjustment) AS 'Total Amount of Adjustments'
	From FactTable
		Inner Join dimTransaction
			  On FactTable.dimTransactionPK = dimTransaction.dimTransactionPK
		Inner Join dimLocation
			  On FactTable.dimLocationPK = dimLocation.dimLocationPK
		Inner Join dimPhysician
			  On FactTable.dimPhysicianPK = dimPhysician.dimPhysicianPK
	Where AdjustmentReason = 'credentialing' And LocationName = 'Angelstone Community Hospital'
	Group by LocationName,
			 ProviderName
	Order by 3 DESC