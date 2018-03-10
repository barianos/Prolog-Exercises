affinity(john, ann, spouse).
type_of_service(ann, hospitalization).
insurance_cover(john, hospitalization).
insurance_support(john, partial).
type_of_insurance(john, family).
requested_compensation(john, 5000).






compensation(Insured, all_money) :- patient_support(Insured,Patient),
								insurance_cover(Insured,hospitalization),
								type_of_service(Patient,hospitalization),
								insurance_support(Insured, full).

compensation(Insured,Amount) :- requested_compensation(Insured, Amount) ,
							Amount =< 5000 ,
							patient_support(Insured, Patient) ,
							insurance_cover(Insured, hospitalization),
							type_of_service(Patient, hospitalization),
							insurance_support(Insured, partial).


patient_support(Insured,Patient) :- affinity(Insured, Patient, spouse) , 
									type_of_insurance(Insured, family).
