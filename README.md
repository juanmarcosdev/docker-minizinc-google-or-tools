<h1>TL;DR for this repo:</h1>
<img src="https://1000marcas.net/wp-content/uploads/2020/02/Docker-Logo.png" height="100" width="100">
<ul>
  <li><h4>Technology Language used:</h4>Docker</li>
  <li><h4>Approximate date:</h4>First semester of 2020</li>
  <li><h4>Purpose:</h4>This is an open source project: a Docker image forked from official MiniZinc image minizinc/minizinc. The additional feature that this image brings is that it has fully functional Google's OR-Tools constraint programming solver, apart from the ones that MiniZinc has in the official image (Gecode, Chuffed & Coin-BC). So pulling this image and executing it in a new container would bring you new possibilities, as you can run your MiniZinc models with this interesting solver from Google too. You may ask, How do I run my models using OR-Tools Solver? It is pretty easy. Inside the container running the image (doing something like <code>docker exec -it <your_container_name_or_id> /bin/bash</code> you can easily from command line: <code>minizinc <your_model>.mzn <your_data>.dzn</code>. Within this image OR-Tools is setup to be the default solver. Optionally you can use the <code>--solver <or-tools/gecode/coinbc/chuffed></code>flag to select a specific solver included in the image. Pull requests and commentaries for improving the Dockerfile are received. Credits & License to Monash University and MiniZinc Team for developing MiniZinc, Google for developing OR Tools. Special thanks to Jip J. Dekker (Dekker1) for their contributions to the code.</li>
</ul>
