import pandas as pd
import numpy as np


def transform_data(df):

    # Create copy
    df = df.copy()

    # Remove duplicate records
    df = df.drop_duplicates()

    # ---------------------------------------------------
    # Remove unnecessary columns
    # ---------------------------------------------------

    drop_cols = [
        "id",
        "member_id",
        "url",
        "desc",
        "policy_code"
    ]

    df = df.drop(
        columns=drop_cols,
        errors="ignore"
    )

    # ---------------------------------------------------
    # Convert date columns
    # ---------------------------------------------------

    date_cols = [
        "issue_d",
        "earliest_cr_line",
        "last_pymnt_d",
        "last_credit_pull_d"
    ]

    for col in date_cols:

        if col in df.columns:

            df[col] = pd.to_datetime(
                df[col],
                format="%b-%Y",
                errors="coerce"
            )

    # ---------------------------------------------------
    # Handle Missing Values
    # ---------------------------------------------------

    # Numeric columns
    numeric_cols = df.select_dtypes(
        include=np.number
    ).columns

    for col in numeric_cols:

        df[col] = df[col].fillna(
            df[col].median()
        )

    # Categorical columns
    cat_cols = df.select_dtypes(
        include="object"
    ).columns

    for col in cat_cols:

        if not df[col].mode().empty:

            df[col] = df[col].fillna(
                df[col].mode()[0]
            )

    # ---------------------------------------------------
    # Data Type Conversion
    # ---------------------------------------------------

    # Term
    if "term" in df.columns:

        df["term"] = (
            df["term"]
            .astype(str)
            .str.replace(" months", "", regex=False)
        )

        df["term"] = pd.to_numeric(
            df["term"],
            errors="coerce"
        )

    # Employment Length
    if "emp_length" in df.columns:

        df["emp_length"] = (
            df["emp_length"]
            .astype(str)
            .str.extract(r"(\d+)", expand=False)
        )

        df["emp_length"] = pd.to_numeric(
            df["emp_length"],
            errors="coerce"
        )

    # Interest Rate
    if "int_rate" in df.columns:

        df["int_rate"] = (
            df["int_rate"]
            .astype(str)
            .str.replace("%", "", regex=False)
        )

        df["int_rate"] = pd.to_numeric(
            df["int_rate"],
            errors="coerce"
        )

    # ---------------------------------------------------
    # Feature Engineering
    # ---------------------------------------------------

    if "issue_d" in df.columns:

        df["issue_year"] = df["issue_d"].dt.year
        df["issue_month"] = df["issue_d"].dt.month
        df["issue_quarter"] = df["issue_d"].dt.quarter

    if "annual_inc" in df.columns:

        df["monthly_income"] = (
            df["annual_inc"] / 12
        )

    if {"loan_amnt", "annual_inc"}.issubset(df.columns):

        df["loan_income_ratio"] = (
            df["loan_amnt"] /
            df["annual_inc"]
        )

    if {
        "installment",
        "monthly_income"
    }.issubset(df.columns):

        df["installment_income_ratio"] = (
            df["installment"] /
            df["monthly_income"]
        )

    if {
        "issue_year",
        "earliest_cr_line"
    }.issubset(df.columns):

        df["credit_age"] = (
            df["issue_year"] -
            df["earliest_cr_line"].dt.year
        )

    if "annual_inc" in df.columns:

        df["income_category"] = pd.cut(

            df["annual_inc"],

            bins=[
                0,
                50000,
                100000,
                np.inf
            ],

            labels=[
                "Low",
                "Middle",
                "High"
            ]

        )

    if "loan_amnt" in df.columns:

        df["loan_category"] = pd.cut(

            df["loan_amnt"],

            bins=[
                0,
                5000,
                15000,
                np.inf
            ],

            labels=[
                "Small",
                "Medium",
                "Large"
            ]

        )

    if "revol_util" in df.columns:

        df["revol_util_category"] = pd.cut(

            df["revol_util"],

            bins=[
                0,
                30,
                60,
                100
            ],

            labels=[
                "Low",
                "Medium",
                "High"
            ]

        )

    return df