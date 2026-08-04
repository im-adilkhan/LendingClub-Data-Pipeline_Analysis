import pandas as pd

def load_data(df,output_path):
    df.to_csv(
        output_path,
        index=False
    )
    
    print(
        f"Data loaded successfully to {output_path}"
    )