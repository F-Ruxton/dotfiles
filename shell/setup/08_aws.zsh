# ==============================================================================
# Localstack
alias awslocal="aws --endpoint-url http://localhost:4566"
alias s3local="awslocal s3"

function s3local-sync-up() {
  s3local sync "s3-local/$1" "s3://$1"
}

function s3local-sync-down() {
  s3local sync "s3://$1" "s3-local/$1"
}
