
# for vast
touch .no_auto_tmux

# drop last line with PS1
mv .bashrc .bashrc.back
cat .bashrc.back | grep -vE '^PS1' > .bashrc

mkdir runs
tensorboard \
    --logdir=runs \
    --host=0.0.0.0 \
    --port=6006 \
    --reload_interval=1 &

jupyter notebook \
	--no-browser \
	--allow-root \
	--ip=0.0.0.0 \
	--port=8888 \
	--NotebookApp.token='' \
	--NotebookApp.password=''
