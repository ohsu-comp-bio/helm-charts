> [!IMPORTANT]
>
> This Helm Chart repo has traditionally been used for deploying CALYPR-related services by external collaborators (e.g. Gen3-Workflow + Funnel) 
>
> The larger CALYPR "Umbrella" Helm Chart may be found at [calypr/gen3-helm](https://github.com/calypr/gen3-helm)
>
> Moving forward, this repo will likely be merged into [calypr/gen3-helm](https://github.com/calypr/gen3-helm) at which point collaborators can be notified of the change.

# Helm Charts 📚

Helm charts for deploying various projects on any kubernetes cluster.

## TL;DR ⚡
```
helm repo add ohsu https://ohsu-comp-bio.github.io/helm-charts
helm repo update ohsu

# Install GRIP
helm upgrade --install grip ohsu/grip

# Install Funnel
helm upgrade --install funnel ohsu/funnel
```

# Programs 💻 

| Program | Description |
:--------:|:------------:
<a href="https://bmeg.github.io/grip/"><img width="50%" src="https://github.com/user-attachments/assets/64363c84-ecc6-4de5-8380-4d4f2f2c9ef9"/></a> | [**GRIP**](https://github.com/bmeg/grip) <br> GRIP stands for GRaph Integration Platform. It provides a graph interface on top of a variety of existing database technologies including: MongoDB, Elasticsearch, PostgreSQL, MySQL, MariaDB, Badger, and LevelDB.
<a href="https://ohsu-comp-bio.github.io/funnel/"><img width="50%" src="https://github.com/user-attachments/assets/f51cf06b-d802-4e20-bde1-bcd1fc5657e6"/><a/> | [**Funnel**](https://github.com/ohsu-comp-bio/funnel) <br> Funnel is a toolkit for distributed, batch task execution, including a server, worker, and a set of compute, storage, and database backends.

## [GRIP](https://github.com/bmeg/grip) 🔧

```
helm upgrade --install funnel ohsu/grip --create-namespace --namespace grip
```

## [Funnel](https://github.com/ohsu-comp-bio/funnel) 🌪️️

```
helm upgrade --install funnel ohsu/funnel --create-namespace --namespace funnel
```

# Additional Resources 📚

- [Helm Repo](https://ohsu-comp-bio.github.io/helm-charts)

- [Helm Repo Source](https://github.com/ohsu-comp-bio/helm-charts)

- [Helm Charts](https://github.com/ohsu-comp-bio/funnel/tree/develop/deployments/kubernetes/helm/funnel)

- [The Chart Best Practices Guide](https://helm.sh/docs/chart_best_practices/)

# Credits 🤝

Adapted from the [Gen3 Helm Charts repo](https://github.com/uc-cdis/gen3-helm) from the [Center for Translational Data Science](https://github.com/uc-cdis)
