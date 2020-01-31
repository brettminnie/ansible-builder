Example 

From the playbooks directory
```bash
$ docker run --rm -v `pwd`:/home/tools/data -v ~/.ssh:/home/tools/.ssh -e AWS_PROFILE=my_profile AWS_REGION=eu-west-2 bdbstudios/ansible-builder bash -c "ansible -i hosts site.yml"
$ docker run --rm -v `pwd`:/home/tools/data -v ~/.ssh:/home/tools/.ssh -e AWS_PROFILE=my_profile AWS_REGION=eu-west-2  bdbstudios/ansible-builder bash -c "ansible -i hosts playbook.yml <-e env='foo'> <--tags=bar> <-vvv>"

```