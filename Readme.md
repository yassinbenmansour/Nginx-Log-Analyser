# Access Log Analyzer

This Bash script analyzes an Nginx (or Apache) `access.log` file and provides the following statistics:
- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes (excluding invalid or missing status codes)
- Top 5 user agents (excluding missing user agents)

## Features
- Filters out missing or invalid status codes (`-`).
- Properly handles user agents, skipping missing values.
- Clean, human-readable output.

## Usage

1. Make sure your log file is named `access.log` and placed in the same directory as the script, or update the `LOG_FILE` variable inside the script.
   
2. Run the script:

```bash
chmod +x analyze_logs.sh
./analyze_logs.sh

