# mydockerfiles

# Docker files 

My try to keep things simple

## Building

To build a docker

For instance, run ``` docker build -t <name:tag>. -f <type>.Dockerfile ```


Few prior settings (especially on a new machine)


```bash
sudo apt-get install docker.io
sudo usermod -aG docker $USER //register the group

```
# run 

I am not in favour of entrypoint script, I just it makes your life complicated.


## Types of environment

- X68-64 with CUDA and custom Alienware based settings
- Jetson TX2 based
- Raspberry PI based

# TODO

- Test Jetson add ons 
- Create a docker compose

# Gitlab actions

- To create a runner go to Actions and then create a new workflow with your defined purpose like publish/build etc.



## License
[MIT](https://choosealicense.com/licenses/mit/)
