FROM minizinc/minizinc

RUN apt-get update && apt-get install wget -y && wget https://github.com/google/or-tools/releases/download/v7.6/or-tools_flatzinc_ubuntu-18.04_v7.6.7691.tar.gz && apt-get purge wget -y && tar -xzvf or-tools_flatzinc_ubuntu-18.04_v7.6.7691.tar.gz && rm or-tools_flatzinc_ubuntu-18.04_v7.6.7691.tar.gz && mv or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/bin/fzn-or-tools /usr/local/bin && mv or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/share/minizinc/ or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/share/ortools && mv or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/share/ortools/ /usr/local/share/minizinc && rm -rf /usr/local/lib  && mv or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/lib/ /usr/local/share/minizinc/lib && echo '{ \n\
  "id": "com.google.or-tools",\n\
  "name": "OR-Tools",\n\
  "description": "OR Tools Constraint Programming Solver (from Google)",\n\
  "version": "7.6.0",\n\
  "mznlib": "-Gortools",\n\
  "executable": "../../../bin/fzn-or-tools",\n\
  "tags": ["cp","int", ],\n\
  "stdFlags": ["-a","-n","-s","-v","-p","-f","-t"],\n\
  "supportsMzn": false,\n\
  "supportsFzn": true,\n\
  "needsSolns2Out": true,\n\
  "needsMznExecutable": false,\n\
  "needsStdlibDir": false,\n\
  "isGUIApplication": false \n\
}' >> /usr/local/share/minizinc/solvers/or-tools.msc && rm -rf or-tools_flatzinc_Ubuntu-18.04-64bit_v7.6.7691/ && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/share/minizinc/lib && echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/share/minizinc/lib' >> ~/.bashrc && echo $LD_LIBRARY_PATH

