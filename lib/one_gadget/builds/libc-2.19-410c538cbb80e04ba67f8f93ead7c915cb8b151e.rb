require 'one_gadget/gadget'
# Intel 80386
# 
# GNU C Library (GNU libc) stable release version 2.19, by Roland McGrath et al.
# Copyright (C) 2014 Free Software Foundation, Inc.
# This is free software; see the source for copying conditions.
# There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.
# Compiled by GNU CC version 4.8.2 20140206 (prerelease).
# Compiled on a Linux 3.13.2 system on 2014-02-08.
# Available extensions:
# 	crypt add-on version 2.1 by Michael Glad and others
# 	GNU Libidn by Simon Josefsson
# 	Native POSIX Threads Library by Ulrich Drepper et al
# 	BIND-8.2.3-T5B
# libc ABIs: UNIQUE IFUNC
# For bug reporting instructions, please see:
# <https://bugs.archlinux.org/>.

build_id = File.basename(__FILE__, '.rb').split('-').last
OneGadget::Gadget.add(build_id, 255483,
                      constraints: ["ebx is the address of `rw-p` area of libc", "[esp+0x34] == NULL"],
                      effect: "execve(\"/bin/sh\", esp+0x34, environ)")
OneGadget::Gadget.add(build_id, 417011,
                      constraints: ["ebx is the address of `rw-p` area of libc", "[esp+0x8] == NULL"],
                      effect: "execl(\"/bin/sh\", \"sh\", [esp+0x8])")
OneGadget::Gadget.add(build_id, 417017,
                      constraints: ["ebx is the address of `rw-p` area of libc", "eax == NULL"],
                      effect: "execl(\"/bin/sh\", eax)")
OneGadget::Gadget.add(build_id, 417021,
                      constraints: ["ebx is the address of `rw-p` area of libc", "[esp+0x4] == NULL"],
                      effect: "execl(\"/bin/sh\", [esp+0x4])")

