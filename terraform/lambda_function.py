import json
import boto3
import csv
from io import StringIO

def lambda_handler(event, context):
    # Get S3 bucket and object details from the event
    try:
        bucket = event['detail']['bucket']['name']
        key = event['detail']['object']['key']
    except KeyError as e:
        print(f"Error extracting bucket and key from event. Missing key: {e}")
        return {
            'statusCode': 400,
            'body': json.dumps('Error extracting bucket and key from event.')
        }

    # Create an S3 client
    s3 = boto3.client('s3')

    # Download the CSV file from S3
    try:
        response = s3.get_object(Bucket=bucket, Key=key)
        csv_content = response['Body'].read().decode('utf-8')
    except Exception as e:
        print(f"Error getting object {key} from bucket {bucket}. Make sure the object exists and your bucket is in the same region as this function.")
        raise e

    # Process the CSV data (example: print each row)
    csv_reader = csv.reader(StringIO(csv_content))
    for row in csv_reader:
        print(row)

    # Add your logic here to export the data as needed
    # For example, you could insert the data into a database, send it to another service, or perform analytics.

    return {
        'statusCode': 200,
        'body': json.dumps('CSV data exported successfully!')
    }
