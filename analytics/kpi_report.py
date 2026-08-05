import duckdb

con = duckdb.connect("loan_analytics.duckdb")

# Total Loans
total_loans = con.execute("""

SELECT COUNT(*)

FROM loan_data

""").fetchone()[0]

# Total Loan Amount
loan_amount = con.execute("""

SELECT SUM(loan_amnt)

FROM loan_data

""").fetchone()[0]

# Average Loan
avg_loan = con.execute("""

SELECT AVG(loan_amnt)

FROM loan_data

""").fetchone()[0]

# Average Interest
avg_interest = con.execute("""

SELECT AVG(int_rate)

FROM loan_data

""").fetchone()[0]

# Average Income
avg_income = con.execute("""

SELECT AVG(annual_inc)

FROM loan_data

""").fetchone()[0]

# Total Payment
total_payment = con.execute("""

SELECT SUM(total_pymnt)

FROM loan_data

""").fetchone()[0]

print("=" * 50)

print("Loan Analytics KPI Report")

print("=" * 50)

print(f"Total Loans          : {total_loans:,}")

print(f"Total Loan Amount    : {loan_amount:,.2f}")

print(f"Average Loan Amount  : {avg_loan:,.2f}")

print(f"Average Interest (%) : {avg_interest:.2f}")

print(f"Average Income       : {avg_income:,.2f}")

print(f"Total Payment        : {total_payment:,.2f}")

print("=" * 50)

con.close()