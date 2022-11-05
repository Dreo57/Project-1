resource "aws_s3_bucket" "dre_s3" {
    bucket = "real-8402"
      
}

# resource "aws_s3_bucket_website_configuration" "dre-website" {
#     bucket = aws_s3_bucket.dre_s3.bucket
  
# }