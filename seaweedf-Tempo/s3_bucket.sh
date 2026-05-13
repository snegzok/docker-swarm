docker run --rm --network tempo-net \
  -e AWS_ACCESS_KEY_ID=admin \
  -e AWS_SECRET_ACCESS_KEY=admin \
  amazon/aws-cli \
  --endpoint-url http://seaweedfs_s3:8333 \
  s3 mb s3://tempo-traces
