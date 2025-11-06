Use Healthcare_DB

Select
	LocationName,
	Count(Distinct ProviderName) as 'Number of Providers',
	Count(Distinct dimPatient.PatientNumber) as 'Number of Patients',
	Format(SUM(GrossCharge), '$##,###') as 'Gross Charge',
	Format(SUM(GrossCharge)/Count(Distinct dimPatient.PatientNumber), '$#') as 'Average Charge per Patient'
From FactTable
Inner Join dimLocation
	  On FactTable.dimLocationPK = dimLocation.dimLocationPK
Inner Join dimPhysician
	  On FactTable.dimPhysicianPK = dimPhysician.dimPhysicianPK
Inner Join dimPatient
	  ON FactTable.dimPatientPK = dimpatient.dimPatientPK
Group by LocationName
-- A simple table used to analyze the charges, patients and providers from the different locations 
-- and what trends if any exist. 