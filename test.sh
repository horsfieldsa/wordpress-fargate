output=$(aws ssm get-parameter --name wordpress-accesskey --query Parameter.Value)
secret_key=$(echo "${output}" | sed -e 's/^"//' -e 's/"$//')
output=$(aws ssm get-parameter --name wordpress-secretaccesskey --query Parameter.Value)
secret_access_key=$(echo "${output}" | sed -e 's/^"//' -e 's/"$//')

echo "${secret_key}"
echo "${secret_access_key}"
