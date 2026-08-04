import pandas as pd


def validate_data(df):

    # Check dataframe is empty
    if df.empty:
        raise ValueError("Dataset is empty.")

    # Check duplicate records
    if df.duplicated().sum() > 0:
        raise ValueError("Duplicate records found.")

    # Required columns
    required_cols = [
        "loan_amnt",
        "annual_inc",
        "loan_status",
        "issue_d"
    ]

    # Check required columns
    missing_cols = [
        col
        for col in required_cols
        if col not in df.columns
    ]

    if missing_cols:
        raise ValueError(
            f"Missing required columns: {missing_cols}"
        )

    # Check missing values
    if df[required_cols].isnull().sum().sum() > 0:
        raise ValueError(
            "Missing values found in required columns."
        )

    print("Data validation passed.")

    return True