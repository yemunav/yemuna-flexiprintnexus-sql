# FlexiPrintNexus — Print & Design Business Database

![ER Diagram](FlexiPrintNexus_ERD_Simple.png)

*A detailed version with all table fields is available in `FlexiPrintNexus_ERD.png`.*

## Overview
FlexiPrintNexus is a relational database designed for a flex/banner printing
and design business (based in Tamil Nadu, India) offering both **printing
services** (flex banners, stickers, signboards, posters, visiting cards) and
**design-only services** (logo design, invitation card design, poster
design).

The database models the complete order-to-cash lifecycle: a customer
requests a quote, it becomes a confirmed order, materials and machines are
used to fulfill it, the customer pays, the order is delivered (in-house or
via courier), and the customer leaves feedback.

## Business Problem
A small print shop tracking customers and orders manually had no structured
way to answer basic business questions — who its most valuable customers
are, which materials/machines are used most, whether deliveries are on
time, or how much revenue is outstanding. This project models the business
as a relational database and answers those questions with SQL.

## Tools Used
- Oracle SQL Developer
- SQL — schema design (DDL), sample data (DML), and analysis queries
  (JOINs, GROUP BY, subqueries, window functions)

## Schema (14 tables)
| Table | Purpose |
|---|---|
| Customers | Corporate / WalkIn / Online customers |
| Employees | Sales, design, machine operator, delivery, admin staff |
| Products | Printing jobs and design-only services |
| Materials | Raw print media (flex, vinyl, cloth, acrylic, etc.) |
| Machines | Printers and cutters |
| Suppliers | Vendors materials are purchased from |
| DeliveryPartners | Outside couriers used for non-self-pickup deliveries |
| Quotations | Price estimates given before an order is confirmed |
| Orders | Confirmed customer orders |
| OrderItems | Line items per order (size, material, machine, price) |
| Payments | Payments received against orders (Full/Partial/Pending) |
| PurchaseOrders | Materials purchased from suppliers |
| Deliveries | How each order reached the customer |
| Inventory | Stock movement history (IN/OUT) |
| Feedbacks | Customer rating and comments after delivery |

## How to Run
1. Open Oracle SQL Developer and connect to your schema.
2. Run `FlexiPrintNexus_final.sql` — a single script containing all table
   definitions, sample data, and analysis queries, in dependency order.

## Key Findings (from the sample dataset)
- Total revenue: **₹13,560** across 12 sample orders — average order value
  of **₹1,130**.
- Printing services account for **~85% of revenue**; design-only services
  for **~15%**.
- Top customer by spend: **Madurai Corporation (₹2,754)**.
- On-time delivery rate: **~67%** (3 of 9 delivered orders arrived after
  the promised date).
- The two lowest customer ratings both correspond to orders that were
  delivered late.
- **~₹2,584** in payments remain outstanding across 5 orders.
- **Chennai** accounts for ~51% of the customer base — the largest single
  concentration.

## Skills Demonstrated
- Relational schema design (primary keys, foreign keys, CHECK constraints)
- Populating 14+ interlinked tables with realistic sample data
- JOINs (inner, left), GROUP BY, HAVING, CASE WHEN, subqueries
- Window functions: RANK(), ROW_NUMBER() + PARTITION BY, LAG(), running
  totals
- Business-focused analysis: revenue trends, customer segmentation,
  accounts receivable, delivery performance, inventory tracking, and
  customer satisfaction

## Possible Extensions
- A dashboard (Excel/Power BI) built on top of the query results
- A Returns/Reprints table for quality-issue tracking
- Automating OrderItems.Amount with a trigger or computed column
