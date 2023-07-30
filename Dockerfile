FROM minizinc/minizinc AS BUILDER

ARG VERSION="9.1"
ARG REV="9490"
ARG ORT_DIR="or-tools_amd64_flatzinc_ubuntu-18.04_v${VERSION}.${REV}"
ARG ARCHIVE="${ORT_DIR}.tar.gz"

# Install temporary dependencies
RUN apt-get update
RUN apt-get install wget -y

# Download OR-Tools Release
RUN echo "Yass $VERSION"
RUN wget "https://github.com/google/or-tools/releases/download/v${VERSION}/${ARCHIVE}" \
    -O "${ARCHIVE}"
RUN mkdir ./extract_folder
RUN tar -xzvf ${ARCHIVE} -C ./extract_folder


# Setup Binary files
RUN mkdir /ortools
RUN ls  -lah
RUN mv extract_folder/or-tools_flatzinc_Ubuntu-18.04-64bit_v${VERSION}.${REV}/bin extract_folder/or-tools_flatzinc_Ubuntu-18.04-64bit_v${VERSION}.${REV}/lib /ortools

# Setup OR-Tools MiniZinc library
RUN mkdir -p /ortools/share/minizinc/ortools
RUN mv extract_folder/or-tools_flatzinc_Ubuntu-18.04-64bit_v${VERSION}.${REV}/share/minizinc/* /ortools/share/minizinc/ortools/

# Add OR-Tools solver configuration
RUN mkdir -p /ortools/share/minizinc/solvers
RUN echo "{ \n\
  \"id\": \"com.google.or-tools\",\n\
  \"name\": \"OR-Tools\",\n\
  \"description\": \"OR Tools Constraint Programming Solver (from Google)\",\n\
  \"version\": \"${VERSION}.${REV}\",\n\
  \"mznlib\": \"-Gortools\",\n\
  \"executable\": \"../../../bin/fzn-or-tools\",\n\
  \"tags\": [\"cp\",\"int\", ],\n\
  \"stdFlags\": [\"-a\",\"-n\",\"-s\",\"-v\",\"-p\",\"-f\",\"-t\"],\n\
  \"supportsMzn\": false,\n\
  \"supportsFzn\": true,\n\
  \"needsSolns2Out\": true,\n\
  \"needsMznExecutable\": false,\n\
  \"needsStdlibDir\": false,\n\
  \"isGUIApplication\": false \n\
}" >> /ortools/share/minizinc/solvers/or-tools.msc

# Set OR-Tools as default MiniZinc solver
RUN sed 's/org\.gecode\.gecode/com\.google\.or-tools/g' /usr/local/share/minizinc/Preferences.json > /ortools/share/minizinc/Preferences.json

FROM minizinc/minizinc

COPY --from=BUILDER /ortools/ /usr/local/
