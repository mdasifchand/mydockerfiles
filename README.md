# mydockerfiles

# Docker files for dev-environment

So I tend to use different PC's for development and it so happens sometimes I tend to miss some of the deps.
I would preferably would like to have my environment variables all located inisde a docker and make it all reusable 

## Building

To build a docker

For instance, run ``` docker build . -f dev.Dockerfile ```


To install run the script run.sh

```bash
sudo usermod -aG docker $USER
bash run.sh
```
# run 



## Types of environment

- X68-64 with CUDA and custom Alienware based settings
- Jetson TX2 based
- Raspberry PI based



## License
[MIT](https://choosealicense.com/licenses/mit/)
