lxc exec test -- rm charmed-karapace_3.11.4_amd64.snap
lxc file push charmed-karapace_3.11.4_amd64.snap test/root/
lxc exec test -- chown root:root charmed-karapace_3.11.4_amd64.snap
lxc exec test -- ls -la
