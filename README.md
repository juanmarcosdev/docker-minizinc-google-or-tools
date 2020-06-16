# minizinc-or-tools
Repo of Dockerfile for Docker image of MiniZinc bundled with OR-Tools Solver

Check it out and pull it at https://hub.docker.com/r/juanmarcos935/minizinc-or-tools

* This is an image forked from official MiniZinc image minizinc/minizinc. The additional feature that this image brings is that it has fully functional Google's OR-Tools constraint programming solver, apart from the ones that MiniZinc has in the official image (Gecode, Chuffed & Coin-BC). So pulling this image and executing it in a new container would bring you new possibilities, as you can run your MiniZinc models with this interesting solver from Google too.

## Credits & License to Google for developing OR Tools
