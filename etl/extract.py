import os
import pandas as pd

def extract_data(file_path):
    if not os.path.exists(file_path):
        raise FileNotFoundError(f"File not found: {file_path}")
    
    df = pd.read_csv(file_path, low_memory=False)
    
    return df