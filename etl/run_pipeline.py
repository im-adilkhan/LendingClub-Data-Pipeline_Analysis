from extract import extract_data
from transform import transform_data
from validate import validate_data
from load import load_data


def run_pipeline():

    input_path = (
        r"C:\Users\henry\OneDrive\Desktop\LendingClub-Data-Pipeline\data\raw\loan.csv"
    )

    output_path = (
        r"C:\Users\henry\OneDrive\Desktop\LendingClub-Data-Pipeline\data\processed\clean_loan.csv"
    )

    # Extract
    df = extract_data(input_path)

    # Transform
    df = transform_data(df)

    # Validate
    validate_data(df)

    # Load
    load_data(df, output_path)

    print("ETL Pipeline Completed Successfully.")


if __name__ == "__main__":
    run_pipeline()
