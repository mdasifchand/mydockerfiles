# mydockerfiles

# Docker files for (different) dev-environment

So I tend to use different PC's for development and it so happens sometimes I tend to miss some of the deps.
I would preferably would like to have my environment variables and necessary packages all located inisde a docker and make it all reusable 

## Building

To build a docker

For instance, run ``` docker build . -f dev.Dockerfile ```


Few prior settings (especially on a new machine)


```bash
sudo apt-get install docker.io
sudo usermod -aG docker $USER //register the user

```
# run 

 There is no entrypoint script simply because I would to pass on entrypoint with `docker run`instead of having one readily available. 


## Types of environment

- X68-64 with CUDA and custom Alienware based settings
- Jetson TX2 based
- Raspberry PI based

# TODO

- Test Jetson add ons 



## License
[MIT](https://choosealicense.com/licenses/mit/)
