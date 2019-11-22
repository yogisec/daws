Just a quick Docker implementation of aws cli

Two volumes are mapped in, 1 mapped to the local folder to allow for files to transfer back and forth. The second volume mounts the `creds` file into the container at `/root/.aws/credentials`. 
This lets you define multiple credentials and pass the `--profile` command

### Build it:
```
docker image build -t yogiawscli:1.0 .
```

### Test it:
```
docker run --rm -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=xxx -v $(pwd):/aws -v $(pwd)/creds:/root/.aws/ yogiawscli:1.0 aws sts get-caller-identity
```

### Make it easy to use:
```
alias daws='docker run --rm -e AWS_ACCESS_KEY_ID=xxx -e AWS_SECRET_ACCESS_KEY=xxx -v $(pwd):/aws -v $(pwd)/creds:/root/.aws/ yogiawscli:1.0 aws'
```

### Use it:
```
daws sts get-caller-identity
```

### Use it with specific profile:
```
daws --profile xxx sts get-caller-identity
```
