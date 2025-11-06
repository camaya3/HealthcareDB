USE Healthcare_DB

	Select 
	CONCAT(FirstName,' ',LastName) as Full_Name,
	Email,
	PatientAge,
	Concat(City, ', ', State) as City_State,
	Case 
		when PatientAge < 18 then 'Less than 18'
		when PatientAge <65 then 'Between 18 and 65'
		else '65 and older' End as Age_Group
	From dimPatient
	Order by 3