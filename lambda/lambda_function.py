# Lambda Fuction to move files from one bucket to another based on the file-types example

import boto3
import json

def lambda_handler(event, context):
    s3 = boto3.resource('s3')
    src_bucket = s3.Bucket('mybucket-test-all-files')
    dest_bucket_jpg = s3.Bucket('mybucket-test-jpg-files')
    dest_bucket_png = s3.Bucket('mybucket-test-png-files')
    
    for object in src_bucket.objects.all():
        if object.key.endswith('.jpg') or object.key.endswith('.jpeg'):
            copy_source = {
                'Bucket': src_bucket,
                'Key': object.key
            }
            dest_bucket_jpg.copy(copy_source, object.key)
            object.delete()
        elif object.key.endswith('.png'):
            copy_source = {
                'Bucket': src_bucket,
                'Key': object.key
            }
            dest_bucket_png.copy(copy_source, object.key)
            object.delete()
        else: 
            print("Not copying any objects with diff file-types")
    # TODO implement
    return {
        'statusCode': 200,
        'body': json.dumps('Files Copied Successfully')
    }
