CREATE INDEX idx_loan_status
ON loan_data(loan_status);

CREATE INDEX idx_grade
ON loan_data(grade);

CREATE INDEX idx_state
ON loan_data(addr_state);

CREATE INDEX idx_purpose
ON loan_data(purpose);

CREATE INDEX idx_issue_year
ON loan_data(issue_year);

CREATE INDEX idx_income_category
ON loan_data(income_category);

CREATE INDEX idx_loan_category
ON loan_data(loan_category);

CREATE INDEX idx_grade_status
ON loan_data(
    grade,
    loan_status
);

CREATE INDEX idx_issue_year_month
ON loan_data(
    issue_year,
    issue_month
);