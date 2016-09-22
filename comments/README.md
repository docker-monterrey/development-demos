# Poll Comments ASP.NET App

## 1: How this project was created?

On the parent folder:

```bash
# Run a container from the microsoft's dotnet image, mounting the root folder:
docker run --rm -v $(pwd):/usr/src -ti microsoft/dotnet:1.0.0-preview2-sdk

# Inside the container, run:
mkdir comments && cd comments && dotnet new
```

Then, I followed the instructions on https://docs.asp.net/en/latest/getting-started.html

## 2: The Development Dockerfile

Since dotnet's NuGet package manager allows to - and defaults to - store the
dependency packages outside of the project's folder (at `/root/.nuget/packages`),
we'll call `dotnet restore` in the Dockerfile to pre-install the project's dependencies.
