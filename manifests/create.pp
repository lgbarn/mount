define mount::create($lvol,$vg,$pvol,$size,$fstype='ext4',$mnt_opts='defaults',$dump='0',$passno='0') {
  lvm::volume { $lvol:
    ensure => present,
    vg     => $vg,
    pv     => $pvol,
    fstype => $fstype,
    size   => $size,
  } ->
  fstab { $title:
    source => "/dev/${vg}/${lvol}",
    dest   => $title,
    type   => $fstype,
    opts   => $mnt_opts,
    dump   => $dump,
    passno => $passno,
  } ->
  mounts { $title:
    ensure => present,
    source => "/dev/${vg}/${lvol}",
    dest   => $title,
    type   => $fstype,
    opts   => $mnt_opts,
  } ->
  exec { "mount_${title}":
    command => "/bin/mount ${title}",
    unless  => "/bin/grep -qw ${title} /proc/mounts",
  }
}
