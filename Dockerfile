FROM julia:1.7.2
WORKDIR /StatsWithJuliaBook
RUN apt update; \
    apt install -y --no-install-recommends r-base
COPY Manifest.toml ./
COPY Project.toml ./
RUN julia --project=. -e "using Pkg; Pkg.instantiate()"
COPY . .
CMD ["julia", "--project=."]
