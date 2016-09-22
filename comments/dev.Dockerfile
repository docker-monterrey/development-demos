FROM microsoft/dotnet:1.0.0-preview2-sdk

# 2: We'll set the application path as the working directory
RUN set -ex && mkdir -p /usr/src/app
WORKDIR /usr/src/app

# 3: We'll add the app's binaries path to $PATH:
# (We won't set the HOME path, as it's used by dotnet to store the dependency data)
ENV PATH=/usr/src/app/bin:$PATH

# 4: Install the current project dependencies - they can be safely changed later
# during development by running `dotnet restore`:
ADD project*.json /usr/src/app/
RUN set -ex && dotnet restore && rm -rf project*.json
