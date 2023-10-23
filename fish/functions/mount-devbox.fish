function mount-devbox
  unmount-devbox > /dev/null
  mkdir -p ~/Remote
  sshfs ubuntu@ec2-44-201-20-148.compute-1.amazonaws.com:/home/ubuntu/remote ~/Remote -o IdentityFile=/Users/irfansharif/.aws/keypairs/irfan-modal.pem
end
