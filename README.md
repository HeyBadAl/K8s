### Replica Sets

A ReplicaSet maintains a stable set of replica Pods running at any given time. It's the thing that makes sure that the number of Pods you want running is the same as the number of Pods that are actually running.

You might be thinking, "I thought that's what a Deployment does." Well...yes.

A Deployment is a higher-level abstraction that manages the ReplicaSets for you. You can think of a Deployment as a wrapper around a ReplicaSet. Here's the rub:

You will probably never use ReplicaSets directly. I just need to mention what they are because you'll hear the term thrown around, and might even see them referenced in logs and such.

`kubectl get replicasets`

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  annotations:
    deployment.kubernetes.io/revision: "1"
  creationTimestamp: "2024-01-14T05:55:48Z"
  generation: 6
  labels:
    app: synergychat-web
  name: synergychat-web
  namespace: default
  resourceVersion: "7334"
  uid: ee9438d8-d1bd-4d51-9b1f-b77bd8252b52
spec:
  progressDeadlineSeconds: 600
  replicas: 2
  revisionHistoryLimit: 10
  selector:
    matchLabels:
      app: synergychat-web
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: synergychat-web
    spec:
      containers:
        - image: lanecwagner/synergychat-web:latest
          imagePullPolicy: Always
          name: synergychat-web
          resources: {}
          terminationMessagePath: /dev/termination-log
          terminationMessagePolicy: File
      dnsPolicy: ClusterFirst
      restartPolicy: Always
      schedulerName: default-scheduler
      securityContext: {}
      terminationGracePeriodSeconds: 30
status:
  availableReplicas: 2
  conditions:
    - lastTransitionTime: "2024-01-14T05:55:48Z"
      lastUpdateTime: "2024-01-14T05:56:09Z"
      message: ReplicaSet "synergychat-web-85f945bfdd" has successfully progressed.
      reason: NewReplicaSetAvailable
      status: "True"
      type: Progressing
    - lastTransitionTime: "2024-01-14T18:51:07Z"
      lastUpdateTime: "2024-01-14T18:51:07Z"
      message: Deployment has minimum availability.
      reason: MinimumReplicasAvailable
      status: "True"
      type: Available
  observedGeneration: 6
  readyReplicas: 2
  replicas: 2
  updatedReplicas: 2
```

- `apiVersion: apps/v1`- specifies the version of the Kubernetes API you're using. In this case, `apps/v1` is the Kubernetes API version for ReplicaSets.
- `kind: Deployment`- specifies the kind of object you're using. In this case, `Deployment` is the kind of object you're using.
- `metadata`- metadata about the deployment, like when it was created, its name and its ID.
- `spec`- desired state of the deployment. Most impactful edits, like how many replicas you want, will be made here.
- `status`- current state of the deployment. You wont edit this directly, its just for you to see whats' going on with your deployment.
