# Change Request B: Lab tests

## Scenario
The clinic wants to track lab tests associated with appointments, including orders and results.

## Requirements
- Add a lab_test catalog (name, code, base_price).
- Each appointment can have zero or many lab test orders.
- Each lab test order includes status (ordered, collected, completed, cancelled).
- Store a result summary and result date when completed.
- Lab tests should be included on invoices when billable.

## Deliverables
- Updated ER diagram.
- Migration SQL script.
- Notes on data backfill assumptions.
