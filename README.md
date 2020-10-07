# minizinc-or-tools
Repo of Dockerfile for Docker image of MiniZinc bundled with OR-Tools Solver

Check it out and pull it at https://hub.docker.com/r/juanmarcosdev/minizinc-or-tools

* This is an image forked from official MiniZinc image minizinc/minizinc. The additional feature that this image brings is that it has fully functional Google's OR-Tools constraint programming solver, apart from the ones that MiniZinc has in the official image (Gecode, Chuffed & Coin-BC). So pulling this image and executing it in a new container would bring you new possibilities, as you can run your MiniZinc models with this interesting solver from Google too.

###### Credits & License to Monash University and MiniZinc Team for developing MiniZinc, Google for developing OR Tools

## How do I run my models using OR-Tools Solver?

It is pretty easy. Inside the container running the image (doing something like `docker exec -it <your_container_name_or_id> /bin/bash`) you can easily from command line:

`minizinc <your_model>.mzn <your_data>.dzn`

Within this image OR-Tools is setup to be the default solver. Optionally you can use the `--solver <or-tools/gecode/coinbc/chuffed>` flag to select a specific solver included in the image.

Pull requests and commentaries for improving the Dockerfile are received.
