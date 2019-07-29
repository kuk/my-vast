
# Custom docker image for vast.ai

Build and publish image

```bash
make image push
```

Notes on using vast

```bash
wget https://raw.githubusercontent.com/vast-ai/vast-python/master/vast.py -O vast; chmod +x vast;
./vast login

./vast search offers | grep '1 x '  # --type=bid for interruptable
./vast create instance 362208 --image alexkuk/my-vast --disk 50

watch ./vast show instances

# -N just port forwarding
# -f go background
# 8888 jupyter
# 6006 tensorboard
ssh -Nf -p 15577 root@ssh5.vast.ai -L 8888:localhost:8888 -L 6006:localhost:6006

http://localhost:8888/notebooks/
http://localhost:6006/

./vast destroy instance 365577
```
