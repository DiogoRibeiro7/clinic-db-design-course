# Change Request A: Insurance support

## Scenario

The clinic now accepts insurance for some patients. You must track insurance providers, member IDs, and coverage status, while keeping billing consistent with existing invoices.

## Requirements

- Add support for insurance providers.
- Patients may have zero or one active insurance policy.
- A policy includes provider name, member_id, and plan_name.
- Invoices can reference an insurance policy when applicable.
- Track policy status (active, inactive).

## Deliverables

- Updated ER diagram.
- Migration SQL script.
- Notes on backward compatibility.
