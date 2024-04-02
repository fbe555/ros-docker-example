# Docker connection issue on windows

This repository provides a minimal working example for configuring ROS2 node discovery between a windows host and a docker container.  
The current contents work out of the box on linux hosts, but fails on windows.

## Host prerequisites

In order to replicate the problem make sure the windows host fullfils these criteria:  
- Working installation of ROS2 [instructions](https://docs.ros.org/en/rolling/Installation.html)  
- VSCode with a working [Dev Containers](vscode:extension/ms-vscode-remote.remote-containers) setup. This requires docker and WSL2 as described [here](https://code.visualstudio.com/docs/devcontainers/containers)  

## Replication:

In order to replicate this issue, perform the following steps:  
1. Clone this repository on the host machine.  
2. Open the repo in VSCode and bring up the command palette (Ctrl-Shift-P).  
3. Run the command ```Dev Containers: Rebuild and Reopen in Container```
4. Once the container has started, run ```./scripts/connection_test.bash``` inside of the container.
5. Open a Visual Studio Developper console on the host machine.
6. Source the host ROS setup script
7. Run ```ros2 doctor hello``` on the host machine.

On linux hosts, the host and container machines can see each other, but on windows hosts they cannot. I suspect this has todo with broadcasting not being available in and out of containers on windows but I am unsure. 
I also suspect one potential workaround would be to use a fast dds discovery server, but I haven't gotten that to work either yet.