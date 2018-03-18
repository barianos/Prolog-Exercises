/*The following rules and facts are part of an expert system which supports
the compensation department of an insurance company. The company offers several
types of insurance contracts. In our case, John has a family contract which
supports hospital expenses and its insurance contract is partial meaning that he
is allowed to get back up to a certain amount of money, i.e. less than or equal
to 5000 euro. Write a Prolog program for the following “if .. then ..” rules and
facts in order to be possible to run the goal
« ?-compensation(john, Amount). ».
*/

/* Example Query:
« ?-compensation(john, Amount). ».
will reply yes as long as Amount is <=5000. Any other query will reply no.
*/

/*Facts*/
affinity(john, ann, spouse).
type_of_service(ann, hospitalization).
insurance_cover(john, hospitalization).
insurance_support(john, partial).
type_of_insurance(john, family).
requested_compensation(john, 5000).



/* Rules*/
/*The predicate patient_support/2 replies yes if the patient is covered by the
insurance of Insured */
patient_support(Insured,Patient) :- affinity(Insured, Patient, spouse) ,
									type_of_insurance(Insured, family).

/* the compensation/2 predicate returns answers the question of wheather the Insured
person should get a compensation for an amount of money
We implent this predicate for two possible diferentiantions
1) fully insured will get a full refund
2) a specific amount will be compensated, only if it is lower than the maximum
that is set by the contract
*/

compensation(Insured, all_money) :- patient_support(Insured,Patient),
								insurance_cover(Insured,hospitalization),
								type_of_service(Patient,hospitalization),
								insurance_support(Insured, full).

compensation(Insured,Amount) :- requested_compensation(Insured, X) ,
							Amount =< X ,
							patient_support(Insured, Patient) ,
							insurance_cover(Insured, hospitalization),
							type_of_service(Patient, hospitalization),
							insurance_support(Insured, partial).

/*Facts Ekfwnisis
affinity(john, ann, spouse)
type_of_service(ann, hospitalization)
insurance_cover(john, hospitalization)
insurance_support(john, partial)
type_of_insurance(john, family)
requested_compensation(john, 5000)
*/

/*Rules Ekfwnisis
if patient_support(Insured, Patient) and
	insurance_cover(Insured, hospitalization) and
	type_of_service(Patient, hospitalization) and
	insurance_support(Insured, full)
then compensation(Insured, all_money)

if requested_compensation(Insured, Amount) and
	Amount < 5000 and patient_support(Insured, Patient) and
	insurance_cover(Insured, hospitalization) and
	type_of_service(Patient, hospitalization) and
	insurance_support(Insured, partial) and
then compensation(Insured, Amount)

if affinity(Insured, Patient, spouse) and
	type_of_insurance(Insured, family)
then patient_support(Insured, Patient)
*/
