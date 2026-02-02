# Clinic domain requirements

## Narrative

A small outpatient clinic schedules appointments between patients and doctors. Each appointment may include one or more services and can result in an invoice. Patients may have multiple appointments over time. Doctors have specialties and provide services. The clinic wants to track appointments, services performed, and billing details to support daily operations and reporting.

## Base business rules

1) A patient can have zero or many appointments.
2) Each appointment belongs to exactly one patient.
3) A doctor can have zero or many appointments.
4) Each appointment is assigned to exactly one doctor.
5) Appointments have a scheduled date, start time, and end time.
6) An appointment can include one or more services.
7) Each service is defined in a service catalog with a name and base price.
8) Each appointment service records quantity and price at the time of service.
9) An appointment can generate at most one invoice.
10) An invoice must be linked to exactly one appointment.
11) An invoice has a status (draft, issued, paid, void).
12) An invoice has line items that reference appointment services.
13) A patient may have insurance information on file.
14) A doctor has one primary specialty.
15) A clinic staff member schedules appointments.
16) A room may be assigned to an appointment.
17) A patient contact record includes phone and email.
18) A doctor can be marked active or inactive.
19) An appointment must not overlap for the same doctor.
20) A service can be marked inactive but remains in history.

## Scope boundaries (out of scope)

- Inpatient admissions and bed management.
- Pharmacy inventory management.
- Payroll and HR records.
- Detailed insurance claims processing.
- Patient portals and messaging.
- Telemedicine session recording.
