# mydockerfiles

# Docker files 

So I have an alienware, raspberry pi and a Jetson TX2.  I had this thought of creating environment for all of them as a backup In case I would like to compile/build sources in them using rsync.

## Building

To build a docker

For instance, run ``` docker build -t <name:tag>. -f <type>.Dockerfile ```


Few prior settings (especially on a new machine)


```bash
sudo apt-get install docker.io
sudo usermod -aG docker $USER //register the group

```
# run 

I am not in favour of a default entrypoint script, It just it makes your life complicated,I like the idea of overriding one at runtime. 


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
