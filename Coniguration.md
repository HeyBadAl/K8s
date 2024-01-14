# Config Maps

ConfigMaps allows us to decouple our configuration from our container images, which is important because we don't want to have to rebuild our images every time we want to change a configuration value.

Dockerfile:

```Dockerfile
ENV PORT=3000
```

- everyone will have to use port 3000
- if we want to change the port, we will have to rebuild the image
